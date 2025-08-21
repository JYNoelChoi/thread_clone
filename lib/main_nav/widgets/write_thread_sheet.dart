import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class WriteThreadSheet extends StatefulWidget {
  const WriteThreadSheet({super.key});

  @override
  State<WriteThreadSheet> createState() => _WriteThreadSheetState();
}

class _WriteThreadSheetState extends State<WriteThreadSheet> {
  final TextEditingController _textController = TextEditingController();
  bool _isPostButtonEnabled = false;
  final Faker faker = Faker();
  String userName = "";
  String userProfileUrl = "";

  @override
  void initState() {
    super.initState();
    userName = faker.internet.userName();
    userProfileUrl = faker.image.loremPicsum(seed: 'user');
    _textController.addListener(() {
      setState(() {
        _isPostButtonEnabled = _textController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const Text(
                    'New thread',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(width: 80), // To balance
                ],
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(userProfileUrl),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        TextField(
                          controller: _textController,
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'Start a thread...',
                            border: InputBorder.none,
                          ),
                          maxLines: null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Anyone can reply'),
                  TextButton(
                    onPressed: _isPostButtonEnabled ? () {} : null,
                    child: const Text('Post'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
