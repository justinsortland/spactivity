import 'package:SPACtivity/constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget{
  final int currentIndex;
  final void Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: NorthwesternPurple,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: Offset(0,-3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensures text labels are visible
        currentIndex: currentIndex,
        onTap: (index) {
          // Use navigator to navigate to selected page
          switch(index) {
            case 0:
              // Home page
              Navigator.of(context).pushReplacementNamed('/'); // Replace current page w/ new page
              break;
            case 1:
              // Search page
              Navigator.of(context).pushReplacementNamed('/facilities'); // Replace current page w/ new page
              break;
            case 2:
              // Map page
              Navigator.of(context).pushReplacementNamed('/search'); // Replace current page w/ new page
              break;
            case 3:
              // Settings page
              Navigator.of(context).pushReplacementNamed('/settings'); // Replace current page w/ new page
              break;   
            default:
              break;                                       
          }
        },
        backgroundColor: NorthwesternPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_basketball),
            label: 'Facilities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}