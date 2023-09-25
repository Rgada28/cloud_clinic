import 'package:ekam_cloud_clinic/screens/view_booking_screen.dart';
import 'package:ekam_cloud_clinic/screens/home_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key, required this.index});

  final int index;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedTabIndex = 0;

  Widget activePage = const MyHomePage();
  @override
  void initState() {
    super.initState();
    _selectedTabIndex = widget.index;
  }

  void _selectPage(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedTabIndex == 1) {
      activePage = const ViewBookingScreen();
    } else {
      activePage = const MyHomePage();
    }
    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTabIndex,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                label: "Home",
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blueAccent.shade700,
                )),
            const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: "View Bookings",
              activeIcon: Icon(Icons.calendar_month),
            ),
          ]),
    );
  }
}
