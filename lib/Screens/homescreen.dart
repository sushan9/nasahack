import 'package:flutter/material.dart';
import '../constants.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        keyboardType: TextInputType.text,
        textAlign: TextAlign.center,
        style: kTextfieldTextStyle,
        onChanged: (value) {

        },
        decoration: kTextFieldDecoration.copyWith(
            hintText: 'Enter your full Name'
        ),
      ),
    );
  }
}
