import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.deepOrange,

        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          _buildNavigationBarItem(Icons.home, 'Home', 0),
          _buildNavigationBarItem(Icons.restaurant_menu_rounded, 'Menu', 1),
          _buildNavigationBarItem(Icons.notifications, 'Notifications', 2),
          _buildNavigationBarItem(Icons.favorite, 'Favorite', 3),
          _buildNavigationBarItem(Icons.account_circle, 'Profile', 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: _selectedIndex == index
          ? Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          //shape: BoxShape.circle,
          color: Colors.deepOrange,
        ),
        child: Icon(icon, color: Colors.white),
      )
          : Icon(icon),
      label: label,
    );
  }
}