import 'package:SPACtivity/constants.dart';
import 'package:SPACtivity/page_navigation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final pageNavigationNotifier = Provider.of<PageNavigationNotifier>(context);

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: NorthwesternPurple,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(50.0),
          ),
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
          currentIndex: pageNavigationNotifier.currentIndex,
          backgroundColor: NorthwesternPurple,
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            pageNavigationNotifier.setIndex(index);
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
          items: [
            buildBottomNavigationBarItem(
              Icons.home,
              'Home',
            ),
            buildBottomNavigationBarItem(
              Icons.sports_basketball,
              'Facilities',
            ),
            buildBottomNavigationBarItem(
              Icons.search,
              'Search',
            ),
            buildBottomNavigationBarItem(
              Icons.settings,
              'Settings',
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(IconData iconData, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
      ),
      label: label,
    );
  }
}