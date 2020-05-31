import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:smartagro/Screens/discoveryscreen.dart';
import 'package:smartagro/Screens/messagescreen.dart';
import 'package:smartagro/Screens/results.dart';
import 'Screens/homescreen.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  final List<Widget> _children = [
    DiscoveryScreen(),
    HomeScreen(),
    Results(),
    MessageScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartAgro',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavyBar(
            backgroundColor: Colors.white,
            selectedIndex: _selectedIndex,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: (index) {
              setState(() {
                _selectedIndex=index;
              });
            },
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.apps),
                title: Text('Home'),
                activeColor: Colors.green,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.assignment),
                  title: Text('Submit'),
                  activeColor: Colors.green
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.tv),
                  title: Text('Results'),
                  activeColor: Colors.green
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.message),
                  title: Text('Messages'),
                  activeColor: Colors.green
              ),
            ],
          ),
          body: _children[_selectedIndex],
        ),
      ),
    );
  }
}
