import 'package:flutter/material.dart';
import 'package:triathlon_app/models/Training.dart';

class TrainingDetails extends StatefulWidget {

  final Training training;

  const TrainingDetails({ Key? key, required this.training }) : super(key: key);

  @override
  _TrainingDetailsState createState() => _TrainingDetailsState();
}

class _TrainingDetailsState extends State<TrainingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.training.name),
      ),
    );
  }
}