import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          elevation: 2,
          backgroundColor: Colors.deepOrange,
          selectedFontSize: 14,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            _buildNavigationBarItem(Icons.home_filled, 'Home', 0),
            _buildNavigationBarItem(Icons.event_note, 'Menu', 1),
            _buildNavigationBarItem(Icons.notifications, 'Notifications', 2),
            _buildNavigationBarItem(Icons.favorite, 'Favorite', 3),
            _buildNavigationBarItem(Icons.account_circle, 'Profile', 4),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: _selectedIndex == index
          ? Transform.translate(
        offset: Offset(0, -5),
            child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
            
                  color: Colors.deepOrange,
                ),
                child: Icon(icon, color: Colors.white),
              ),
          )
          : Icon(icon),
      label: label,
    );
  }
}
