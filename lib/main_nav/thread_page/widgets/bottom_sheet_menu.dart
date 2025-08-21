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
    return SizedBox(
      height: _isReportScreen ? MediaQuery.of(context).size.height * 0.8 : null,
      child: _isReportScreen ? _buildReportScreen() : _buildMainMenu(),
    );
  }

  Widget _buildMainMenu() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        Container(
          width: 40,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Unfollow',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Mute',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Hide',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Report',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onTap: _showReportScreen,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReportScreen() {
    return Column(
      children: [
        const SizedBox(height: 12),
        Container(
          width: 40,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
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
              ListTile(
                title: Text("I just don't like it"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(),
              ListTile(
                title: Text("It's spam"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(),
              ListTile(
                title: Text("Hate speech or symbols"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(),
              ListTile(
                title: Text("Nudity or sexual activity"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(),
              ListTile(
                title: Text("Sale of illegal or regulated goods"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(),
              ListTile(
                title: Text("Bullying or harassment"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(),
              ListTile(
                title: Text("Scam or fraud"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(),
              ListTile(
                title: Text("Violence or dangerous organizations"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(),
              ListTile(
                title: Text("Intellectual property violation"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(),
              ListTile(
                title: Text("Suicide or self-injury"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              Divider(),
              ListTile(
                title: Text("False information"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
