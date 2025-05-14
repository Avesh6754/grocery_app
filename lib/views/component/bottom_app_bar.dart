import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cart/cart_page.dart';
import '../home_screen.dart';
import '../profile/profile_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [HomePage(), ProfilePage()];

  void _onMicTap() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(content: Text('Mic button tapped!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _onMicTap,
        backgroundColor: Colors.green,
        child: Icon(Icons.mic, size: 28),
        shape: CircleBorder(eccentricity:0.8),  // Ensures it's perfectly circular
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}