import 'package:flutter/material.dart';

class BottomSheetMenu extends StatefulWidget {
  const BottomSheetMenu({super.key});

  @override
  State<BottomSheetMenu> createState() => _BottomSheetMenuState();
}

class _BottomSheetMenuState extends State<BottomSheetMenu> {
  bool _isReportScreen = false;

  void _showReportScreen() {
    setState(() {
      _isReportScreen = true;
    });
  }

  void _hideReportScreen() {
    setState(() {
      _isReportScreen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _isReportScreen
          ? MediaQuery.of(context).size.height * 0.8
          : null,
      child: _isReportScreen ? _buildReportScreen() : _buildMainMenu(),
    );
  }

  Widget _buildMainMenu() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('Unfollow'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text('Mute'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text('Hide'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: const Text(
            'Report',
            style: TextStyle(color: Colors.red),
          ),
          onTap: _showReportScreen,
        ),
      ],
    );
  }

  Widget _buildReportScreen() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _hideReportScreen,
              ),
              const Text(
                'Report',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(width: 48), // To balance the row
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: ListView(
            children: const [
              ListTile(title: Text("I just don't like it")),
              ListTile(title: Text("It's spam")),
              ListTile(title: Text("Hate speech or symbols")),
              ListTile(title: Text("Nudity or sexual activity")),
              ListTile(title: Text("Sale of illegal or regulated goods")),
              ListTile(title: Text("Bullying or harassment")),
              ListTile(title: Text("Scam or fraud")),
              ListTile(title: Text("Violence or dangerous organizations")),
              ListTile(title: Text("Intellectual property violation")),
              ListTile(title: Text("Suicide or self-injury")),
              ListTile(title: Text("False information")),
            ],
          ),
        ),
      ],
    );
  }
}
