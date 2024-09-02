import 'package:flutter/material.dart';
import 'package:front/screens/home/composents/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' ESPRIT ',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.purple,
      ),
      body: Body(),
    );
  }
}
