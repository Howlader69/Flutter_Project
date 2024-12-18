import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: const Text(
            'My Skills',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          width: context.screenWidth < 900
              ? context.screenWidth * 0.9
              : ((context.screenWidth * 0.8) / 3),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(20),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Programming Language',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              Divider(),
              Wrap(
                spacing:8 ,
                runSpacing:8 ,
                children: [
                Chip(
                  label: Text(
                    'Dart',
                  ),
                  side: BorderSide(color: Colors.indigo),
                  labelStyle: TextStyle(color: Colors.indigo),
                  backgroundColor: Colors.white,
                ),
                Chip(
                  label: Text(
                    'c',
                  ),
                  side: BorderSide(color: Colors.indigo),
                  labelStyle: TextStyle(color: Colors.indigo),
                  backgroundColor: Colors.white,
                ),
              ],)

            ],
          ),
        ),
        Container(
          width: context.screenWidth < 900
              ? context.screenWidth * 0.9
              : ((context.screenWidth * 0.8) / 3),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(20),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Frameworks',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              Divider(),
              Chip(
                label: Text(
                  'Flutter',
                ),
                side: BorderSide(color: Colors.indigo),
                labelStyle: TextStyle(color: Colors.indigo),
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
        Container(
          width: context.screenWidth < 900
              ? context.screenWidth * 0.9
              : ((context.screenWidth * 0.8) / 3),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(20),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Other tools',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              Divider(),
              Chip(
                label: Text(
                  'Flutter',
                ),
                side: BorderSide(color: Colors.indigo),
                labelStyle: TextStyle(color: Colors.indigo),
                backgroundColor: Colors.white,
              ),
            ],
          ),
        )
      ],
    );
  }
}
