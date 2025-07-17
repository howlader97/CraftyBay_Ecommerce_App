import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay_ecommerce_app/data/model/slider_data.dart';
import 'package:craftybay_ecommerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatelessWidget {
  final List<SliderData> sliders;

  HomeSlider({super.key, required this.sliders});

  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(seconds: 3),
            viewportFraction: 0.75,
            aspectRatio: 16 / 9,
            onPageChanged: (int page, _) {
              _selectedSlider.value = page;
            },
          ),
          items:
              sliders.map((sliderData) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            sliderData.image ?? '',
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 6),
                          Text(sliderData.title ?? ''),
                          Text(sliderData.price ?? ''),
                          Text(sliderData.createdAt ?? ''),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
        ),
        const SizedBox(height: 15),
        ValueListenableBuilder(
          valueListenable: _selectedSlider,
          builder: (context, value, _) {
            List<Widget> list = [];
            for (int i = 0; i < sliders.length; i++) {
              list.add(
                Container(
                  height: 10,
                  width: 10,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: value == i ? AppColors.primaryColor : null,
                  ),
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list,
            );
          },
        ),
      ],
    );
  }
}
