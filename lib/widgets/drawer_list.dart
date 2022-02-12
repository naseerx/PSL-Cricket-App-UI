
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DraweList extends StatelessWidget {
  IconData iconsData;
  String title;
  final VoidCallback onTap;
  DraweList({
    required this.iconsData,
    required this.title,
    required this.onTap
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(

        iconsData,
        color: Colors.purple,
        size: 30,
      ),
      title: Text(
      title,
        style: TextStyle(color: Colors.purple,fontFamily: 'b',fontSize: 22),
      ),
      onTap: onTap
    );
  }


}