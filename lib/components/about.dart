import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utils/animated_contact.dart';
import 'package:portfolio/utils/socialrow.dart';
import 'package:velocity_x/velocity_x.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: context.screenWidth < 900
          ? context.screenWidth * 0.9
          : context.screenWidth < 1600
              ? context.screenWidth * 0.3
              : context.screenWidth * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(30.0),
      height: 800.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset(
                'assets/dev.png',
                height: 156,
              ),
              const Text(
                'Prince',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const Text(
                'I am a flutter developer',
                textAlign: TextAlign.center,
              ),
              const Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  Chip(
                    label: Text('Android Developer'),
                    labelStyle: TextStyle(color: Colors.white, fontSize: 14),
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.all(8),
                  ),
                  Chip(
                    label: Text(
                      'Android Developer',
                    ),
                    labelStyle: TextStyle(color: Colors.white, fontSize: 14),
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.all(8),
                  ),
                ],
              ),
              const Divider(),
              AnimatedContact(
                iconData: FontAwesomeIcons.github,
                title: 'Github',
                subtitle: 'Programmer',
                onTap: () {},
              ),
              const SizedBox(
                height: 4,
              ),
              AnimatedContact(
                iconData: FontAwesomeIcons.linkedin,
                title: 'LinkedinIn',
                subtitle: 'Programmer',
                onTap: () {},
              ),
            ],
          ),
          Column(
            children: [
              Divider(),
              Socialrow(),
            ],
          )
        ],
      ),
    );
  }
}
