import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class HSvg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
          ),
          SvgPicture.asset(
            'images/biscuit.svg',
            height: 120,
          ),
        ],
      ),
    );
  }
}
