import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimatedIconButton extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onTap;

  const AnimatedIconButton(
      {super.key, required this.iconData, required this.onTap});

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton> {
  bool isHovering=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      },
      onHover: (value){
        setState(() {
          isHovering=value;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isHovering?Colors.grey.shade300:Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color:isHovering? Colors.grey:Colors.white)
        ),
        padding: EdgeInsets.all(4),
        child: Row(
          children: [
            FaIcon(widget.iconData,size: 28,)
          ],
        ),
      ),
    );
  }
}
