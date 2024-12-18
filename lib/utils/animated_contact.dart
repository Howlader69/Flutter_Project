import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimatedContact extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const AnimatedContact(
      {super.key,
      required this.iconData,
      required this.title,
      required this.subtitle,
      required this.onTap});

  @override
  State<AnimatedContact> createState() => _AnimatedContactState();
}

class _AnimatedContactState extends State<AnimatedContact> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHovering = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: isHovering ? Colors.grey : Colors.white),
            color: isHovering ? Colors.grey.shade300 : Colors.white),
        padding: const EdgeInsets.all(8),
        child:  Row(
          children: [
            Card(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FaIcon(
                widget.iconData,
                size: 20,
              ),
            )),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                Text(widget.subtitle),
              ],
            )
          ],
        ),
      ),
    );
  }
}
