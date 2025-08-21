import 'dart:math';

import 'package:flutter/material.dart';
import 'package:faker/faker.dart' hide Image;
import 'package:thread_clone/main_nav/thread_page/widgets/bottom_sheet_menu.dart';

class Thread extends StatelessWidget {
  final int randSeed;

  const Thread({super.key, required this.randSeed});

  @override
  Widget build(BuildContext context) {
    final faker = Faker(seed: randSeed);
    // Define a set of URL-safe characters.
    const safeChars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final String username = faker.internet.userName();
    final String avatarUrl = 'https://picsum.photos/seed/$username/100/100';
    final String threadText = faker.lorem.sentences(3).join(' ');
    // Generate a 10-character string using only the characters from the set.

    final random = Random();
    int randomNumber = random.nextInt(4);
    final List<String> imageUrls = List.generate(randomNumber, (index) {
      final String imageSeed = faker.randomGenerator.fromCharSet(safeChars, 10);
      return faker.image.loremPicsum(seed: imageSeed);
      // return 'https://picsum.photos/seed/$imageSeed/400/300';
    });

    // print("seed: $seed");
    // print("name: $name");
    // print("userPicUrl: $userPicUrl");
    return Column(
      children: [
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ## 1. User Profile Image (Avatar)
                CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            username,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${faker.randomGenerator.integer(60, min: 1)}m',
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(Icons.more_horiz, color: Colors.grey),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => const BottomSheetMenu(),
                                    isScrollControlled: true,
                                    backgroundColor: Colors.white,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        threadText,
                        style: const TextStyle(fontSize: 15, height: 1.4),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            if (imageUrls
                .isNotEmpty) // Only build this section if there are images
              IntrinsicHeight(
                child: Row(
                  children: [
                    SizedBox(width: 14),
                    VerticalDivider(color: Colors.grey.shade300, thickness: 2),
                    SizedBox(width: 4),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        // Use a SizedBox to constrain the height of the scrollable area
                        child: SizedBox(
                          height: 200, // Give the image row a fixed height
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                // Use a for loop to add spacing between images
                                for (int i = 0; i < imageUrls.length; i++) ...[
                                  Image.network(
                                    imageUrls[i],
                                    // Set a fixed width to prevent overflow
                                    width: imageUrls.length == 1 ? null : 300,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (
                                          BuildContext context,
                                          Object error,
                                          StackTrace? stackTrace,
                                        ) {
                                          // Return a fallback widget, e.g., a placeholder icon or local asset.
                                          return const Icon(
                                            Icons.image_not_supported_rounded,
                                            color: Colors.grey,
                                            size: 50,
                                          );
                                        },
                                    loadingBuilder:
                                        (
                                          BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress,
                                        ) {
                                          if (loadingProgress == null) {
                                            return child; // Image is fully loaded
                                          }
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value:
                                                  loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                  ),
                                  // Add a small gap between images, but not after the last one
                                  if (i < imageUrls.length - 1)
                                    const SizedBox(width: 6),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 8),
            // ## 2d. Interaction Icons
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border, size: 22),
                  onPressed: () {}, // Mock: No function
                ),
                IconButton(
                  icon: const Icon(Icons.mode_comment_outlined, size: 22),
                  onPressed: () {}, // Mock: No function
                ),
                IconButton(
                  icon: const Icon(Icons.repeat, size: 22),
                  onPressed: () {}, // Mock: No function
                ),
                IconButton(
                  icon: const Icon(Icons.send_outlined, size: 22),
                  onPressed: () {}, // Mock: No function
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
