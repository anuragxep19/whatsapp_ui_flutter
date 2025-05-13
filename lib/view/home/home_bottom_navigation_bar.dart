import 'package:flutter/material.dart';
import 'package:whatsapp_ui/view/home/calls_view.dart';
import 'package:whatsapp_ui/view/home/chats_view.dart';
import 'package:whatsapp_ui/view/home/community_view.dart';
import 'package:whatsapp_ui/view/home/updates_view.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  // Controller to manage the swiping between screens
  final PageController _pageController = PageController();

  //Currently selected tab index
  int _selectedIndex = 0;

  // List of main screens
  final List<Widget> _screens = [
    ChatsView(),
    UpdatesView(),
    CommunityView(),
    CallsView(),
  ];

  /// Handle bottom navigation tap
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);

    //Animate to selected page in PageView
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  /// Called when the page is swiped
  void _onPageChanged(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: BouncingScrollPhysics(),
        children: _screens,
      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        onTap: _onItemTapped,

        items: [
          _buildItem(Icons.message, "Chats", 0),
          _buildItem(Icons.update_sharp, "Updates", 1),
          _buildItem(Icons.people_outline, "Communities", 2),
          _buildItem(Icons.call, "Calls", 3),
        ],
      ),
    );
  }

  /// Helper method to build bottom navigation bar item
  BottomNavigationBarItem _buildItem(IconData icon, String label, int index) {
    final bool isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration:
            isSelected
                ? BoxDecoration(
                  color: const Color.fromARGB(82, 76, 175, 79),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(18),
                )
                : null,

        //The tab icon
        child: Icon(
          icon,
          color:
              isSelected ? const Color.fromARGB(255, 26, 85, 28) : Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
