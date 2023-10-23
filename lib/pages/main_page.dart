import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:weather_app/pages/weather_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    WeatherPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        child: const GNav(
          tabs: [
            GButton(
              icon:Icons.home, 
              text: 'Home'
              ),
            GButton(
              icon:Icons.search, 
              text: 'Search'
              ),
            GButton(
              icon:Icons.person, 
              text: 'Profile'
              ),
          ],
        ),
      ),
    );
  }
}