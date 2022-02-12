import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {

  IconData iconData;
  String title;
  final VoidCallback onTap;
  HomeItem({
    required this.iconData,
    required this.title,
    required this.onTap
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            Icon(
              iconData,
              size: 90,
              color: Colors.white,
            ),
            Text(
              title,
              style: TextStyle(color:Colors.white, fontSize: 25,fontFamily: 'a'),
            ),
          ],
        ),
      ),
    );
  }


}