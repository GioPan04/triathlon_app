import 'package:flutter/material.dart';
import 'package:triathlon_app/models/Distance.dart';
import 'package:triathlon_app/screens/HomePage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triathlon',
      home: Home(),
    );
  }
}