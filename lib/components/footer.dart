import 'package:flutter/material.dart';
import 'package:portfolio/utils/socialrow.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20),
      child: const Column(
        children: [
          Socialrow(),
          SizedBox(height: 8,),
          Text('Programmer')
        ],
      ),
    );
  }
}
