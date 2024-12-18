import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:timelines/timelines.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: const EdgeInsets.only( top: 15),
        width: context.screenWidth < 900
            ? context.screenWidth * 0.9
            : context.screenWidth < 1600
                ? context.screenWidth * 0.5
                : context.screenWidth * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(30.0),
        height: 800,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Education',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            //
            Timeline.tileBuilder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                builder: TimelineTileBuilder.fromStyle(
                    itemCount: 4,
                    contentsAlign: ContentsAlign.alternating,
                    contentsBuilder: (context, index) {
                      return const Card(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '20 march,2024',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.indigo),
                              ),
                              Text(
                                'passed 10th',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '10th grade from this paticular and with 90 marks by the second grade',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
    );
  }
}
