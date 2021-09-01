import 'package:flutter/material.dart';
import 'package:triathlon_app/models/Distance.dart';
import 'package:triathlon_app/widgets/IconedRow.dart';

class Running extends StatefulWidget {

  final Distance distance;

  const Running({ Key? key, required this.distance }) : super(key: key);

  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<Running> {

  String currentSport = "Swim";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconedRow(icon: Icons.pool, text: "Swim"),
            IconedRow(icon: Icons.timer, text: "10:43"),
            IconedRow(icon: Icons.favorite_outline, text: "130bpm"),
            Text("1000mt")
          ],
        ),
      ),
    );
  }
}