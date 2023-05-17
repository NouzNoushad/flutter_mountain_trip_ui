import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'trip_home_page.dart';

class MountainTripHome extends StatefulWidget {
  const MountainTripHome({super.key});

  @override
  State<MountainTripHome> createState() => _MountainTripHomeState();
}

class _MountainTripHomeState extends State<MountainTripHome> {
  int currentIndex = 0;

  selectWidget(index) {
    switch (index) {
      case 0:
        return const TripHomePage();
      case 1:
        return Center(
          child: Text(
            'Location',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 50,
            ),
          ),
        );
      case 2:
        return Center(
          child: Text(
            'Map',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 50,
            ),
          ),
        );
      case 3:
        return Center(
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 50,
            ),
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        tabMargin: const EdgeInsets.all(10),
        activeColor: Colors.white,
        color: Colors.black,
        tabBackgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        gap: 4,
        onTabChange: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        tabs: const [
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
          ),
          GButton(
            icon: Icons.location_on_outlined,
            text: 'Location',
          ),
          GButton(
            icon: Icons.map_outlined,
            text: 'Map',
          ),
          GButton(
            icon: Icons.person_outline,
            text: 'Profile',
          ),
        ],
      ),
      body: selectWidget(currentIndex),
    );
  }
}
