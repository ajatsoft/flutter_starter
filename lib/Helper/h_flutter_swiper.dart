import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// Only good for full page splash screen
/// https://pub.dev/packages/flutter_swiper
class HFlutterSwiper extends StatelessWidget {
  final List<Widget> containers = [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Swiper(
      loop: false,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            Expanded(
              child: Swiper(
                autoplay: true,
                autoplayDelay: 3000,
                loop: false,
                itemCount: containers.length,
                viewportFraction: 1,
                pagination: SwiperPagination(),
                itemBuilder: (context, index) {
                  return containers[index];
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget CustomSwiper() {
  final String imageURL =
      'https://images.unsplash.com/photo-1539331914562-acfd435139e5?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max';

  return Swiper(
    loop: false,
    viewportFraction: 0.8,
    //scale: 0.5,
    itemCount: 10,
//      itemWidth: 200,
//      itemHeight: 300,
    //layout: SwiperLayout.CUSTOM,
    //pagination: SwiperPagination(), // Enable this for Dots UI at the bottom
    //control: SwiperControl(), // Enable this for arrow swiping left and right
//        customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
//            .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate(
//                [Offset(-370, -40), Offset(0, 0), Offset(370, -40)]),
    itemBuilder: (context, index) {
      return Container(
        padding: EdgeInsets.only(right: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image(
            fit: BoxFit.fitWidth,
            image: CachedNetworkImageProvider(
              imageURL,
            ),
          ),
        ),
      );
    },
  );
}
