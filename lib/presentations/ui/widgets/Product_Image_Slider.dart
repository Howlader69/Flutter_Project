import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/App_Colors.dart';

class ProductImageSlider extends StatefulWidget {
  final List<String>imageList;
  const ProductImageSlider({super.key, required this.imageList});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();

}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _selectSlider=ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 310.0,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (int page, _) {
                _selectSlider.value = page;
              }),
          items: widget.imageList.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      image: DecorationImage(image: NetworkImage(imageUrl))),
                );
              },
            );
          }).toList(),
        ),

        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _selectSlider,
              builder: (context, value, _) {
                List<Widget>list=[];
                for(int i=0;i<widget.imageList.length;i++){
                  list.add( Container(
                    height: 12,
                    width: 12,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: value == i? AppColors.primaryColor: Colors.white,
                    ),

                  ));
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list,
                );
              }),
        )
      ],
    );
  }
}