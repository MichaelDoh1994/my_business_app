import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_business_app/components/circle_image.dart';
import 'package:my_business_app/screens/appointment_page.dart';
import 'package:my_business_app/screens/home_page.dart';
import 'package:my_business_app/screens/settings.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void _navigateToAppointmentPage() {
    setState(() {
      selectedPageIndex = 1;
    });
  }

  @override
  Widget build(context) {
    Widget activePage = HomeScreen(
      navigateToAppointmentPage: _navigateToAppointmentPage,
    );

    if (selectedPageIndex == 1) {
      activePage = const AppointmentScreen();
    } else if (selectedPageIndex == 2) {
      activePage = const SettingsScreen();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleImage(
                radius: 20,
                image: null,
              ),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        onTap: (index) {
          _selectPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          )
        ],
      ),
    );
  }
}
