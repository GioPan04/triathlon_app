import 'package:flutter/material.dart';

class IconedRow extends StatelessWidget {

  final IconData icon;
  final String text;

  const IconedRow({ Key? key, required this.icon, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(width: 5),
          Icon(icon, size: 28,),
          SizedBox(width: 5),
          Text(text, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}