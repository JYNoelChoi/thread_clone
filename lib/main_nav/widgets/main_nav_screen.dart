import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/main_nav/thread_page/widgets/thread_screen.dart';
import 'package:thread_clone/main_nav/widgets/navigation_tab.dart';
import 'package:thread_clone/main_nav/widgets/write_thread_sheet.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWriteTap() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const WriteThreadSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size10,
            vertical: Sizes.size10,
          ),
          child: Stack(
            children: [
              Offstage(offstage: _selectedIndex != 0, child: ThreadScreen()),
              Offstage(
                offstage: _selectedIndex != 1,
                child: const Center(
                  child: Text("Search", style: TextStyle(fontSize: 20)),
                ),
              ),
              Offstage(
                offstage: _selectedIndex != 3,
                child: const Center(
                  child: Text(
                    "Favorites",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Offstage(
                offstage: _selectedIndex != 4,
                child: const Center(
                  child: Text("User", style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              icon: FontAwesomeIcons.house,
              selectedIcon: FontAwesomeIcons.houseUser,
              isSelected: _selectedIndex == 0,
              onTap: () => _onTap(0),
            ),
            NavTab(
              icon: FontAwesomeIcons.magnifyingGlass,
              selectedIcon: FontAwesomeIcons.magnifyingGlassPlus,
              isSelected: _selectedIndex == 1,
              onTap: () => _onTap(1),
            ),
            NavTab(
              icon: FontAwesomeIcons.penToSquare,
              selectedIcon: FontAwesomeIcons.solidPenToSquare,
              isSelected: _selectedIndex == 2,
              onTap: _onWriteTap,
            ),
            NavTab(
              icon: FontAwesomeIcons.heart,
              selectedIcon: FontAwesomeIcons.solidHeart,
              isSelected: _selectedIndex == 3,
              onTap: () => _onTap(3),
            ),
            NavTab(
              icon: FontAwesomeIcons.user,
              selectedIcon: FontAwesomeIcons.solidUser,
              isSelected: _selectedIndex == 4,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}