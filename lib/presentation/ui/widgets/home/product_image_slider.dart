import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatelessWidget {
  final List<String> imageList;
  ProductImageSlider({super.key, required this.imageList});
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 300,
            autoPlay: false,
            autoPlayAnimationDuration: Duration(seconds: 3),
            viewportFraction: 1,
            aspectRatio: 16 / 9,
            onPageChanged: (int page, _) {
              _selectedSlider.value = page;
            },
          ),
          items:
          imageList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    image: DecorationImage(image: NetworkImage(i),),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 15),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedSlider,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i < imageList.length; i++) {
                list.add(
                  Container(
                    height: 10,
                    width: 10,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: value == i? AppColors.primaryColor: Colors.white
                    ),
                  ),
                );
              }
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list);
            },
          ),
        ),
      ],
    );
  }
}
