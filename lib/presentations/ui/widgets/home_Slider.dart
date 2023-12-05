import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/slider_data.dart';
import '../utility/App_Colors.dart';

class HomeSlider extends StatefulWidget {
  final List<SliderData> sliders;

  const HomeSlider({super.key, required this.sliders});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (int page, _) {
                _selectSlider.value = page;
              }),
          items: widget.sliders.map((SliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      Image.network(SliderData.image ?? ''),
                      Positioned(
                          bottom: 0,
                          child: Column(
                            children: [
                              Text(
                                SliderData.title ?? '',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ],
                          ))
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 16,
        ),
        ValueListenableBuilder(
            valueListenable: _selectSlider,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i < widget.sliders.length; i++) {
                list.add(Container(
                  height: 10,
                  width: 10,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: value == i ? AppColors.primaryColor : null,
                  ),
                ));
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              );
            })
      ],
    );
  }
}
