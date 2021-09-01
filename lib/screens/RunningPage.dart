import 'package:flutter/material.dart';
import 'package:triathlon_app/models/Distance.dart';

class Running extends StatefulWidget {

  final Distance distance;

  const Running({ Key? key, required this.distance }) : super(key: key);

  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<Running> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Allenamento in corso: nuoto. Distanza: ${widget.distance.swimDistance}")),
    );
  }
}