import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/containers/primary_container.dart';
import 'offers_card.dart';

class OfferList extends StatelessWidget {
  const OfferList({super.key});

  @override
  Widget build(BuildContext context) {
    
    return PrimaryContainer(
        height: 200.h,
        padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
        child: CarouselSlider(
          options: CarouselOptions(
              height: 200.h,
              autoPlay: true,
              viewportFraction: 0.9,
              autoPlayAnimationDuration: const Duration(seconds: 2)),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return const OffersCard();
              },
            );
          }).toList(),
        ));
  }
}
