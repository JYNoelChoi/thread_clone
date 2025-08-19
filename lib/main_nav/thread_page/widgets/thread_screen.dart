import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/main_nav/thread_page/widgets/thread.dart';

class ThreadScreen extends StatefulWidget {
  const ThreadScreen({super.key});

  @override
  State<ThreadScreen> createState() => _ThreadScreenState();
}

class _ThreadScreenState extends State<ThreadScreen> {
  late final List<int> seeds = [];
  @override
  void initState() {
    super.initState();
    final random = Random();

    for (int i = 0; i < 10; i++) {
      seeds.add(random.nextInt(999999));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: Sizes.size10),
          width: double.infinity,
          child: FaIcon(FontAwesomeIcons.threads, size: Sizes.size36),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size10,
                vertical: Sizes.size10,
              ),
              child: Column(
                children: [for (var seed in seeds) Thread(randSeed: seed)],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
