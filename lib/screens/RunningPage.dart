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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconedRow(icon: Icons.pool, text: "Swim"),
            IconedRow(icon: Icons.timer, text: "10:43"),
            IconedRow(icon: Icons.favorite_outline, text: "130bpm"),
            
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '1000mt',
                      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'of ' + (widget.distance.swimDistance * 1000).toInt().toString(),
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
          
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("Exit"),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}