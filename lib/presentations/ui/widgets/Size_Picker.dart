import 'package:flutter/material.dart';

import '../utility/App_Colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onSelected, required this.initialSelected});

  final List<String> sizes;
  final Function(int selectIndex) onSelected;
  final int initialSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {

  int _selectSizeIndex=0;
  @override
  void initState() {
    _selectSizeIndex=widget.initialSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.sizes.length,
      itemBuilder: (context,index){
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: (){
            _selectSizeIndex=index;
            widget.onSelected(index);
            if(mounted){
              setState(() {});
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
              color: _selectSizeIndex==index? AppColors.primaryColor : null,
            ),
            child: Text(widget.sizes[index],
              style: TextStyle(
                color: _selectSizeIndex == index
                    ? Colors.white
                    : null,
              ),
            ),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
      return const SizedBox(width: 8,);
    },);
  }
}