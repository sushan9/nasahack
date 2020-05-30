import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:smartagro/Screens/discoveryscreen.dart';
import 'package:smartagro/Screens/messagescreen.dart';
import 'Screens/homescreen.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 1;
  final List<Widget> _children = [
    DiscoveryScreen(),
    HomeScreen(),
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
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.green,
              color: Colors.green[100],
              items: [
                TabItem(icon: Icons.map, title: 'Discovery'),
                TabItem(icon: Icons.add, title: 'Add'),
                TabItem(icon: Icons.assignment, title: 'Report'),
              ],
              initialActiveIndex: 1,//optional, default as 0
              onTap: (int i) {
                setState(() {
                  index = i;
                });
              }
          ),
          body: _children[index],
        ),
      ),
    );
  }
}
