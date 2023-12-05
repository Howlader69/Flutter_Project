import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sectionheader extends StatelessWidget {
  const Sectionheader({
    super.key, required this.title, required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700
        ),),
        TextButton(onPressed: onTap, child: Text('See all'))
      ],
    );
  }
}