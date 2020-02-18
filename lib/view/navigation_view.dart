import 'package:flutter/material.dart';
import 'package:flutter_starter/view/landing/welcome_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'navigation_mobile_landscape.dart';
import 'navigation_mobile_portrait.dart';

class NavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayoutBuilder(
        //portrait: (context) => NavigationViewMobilePortrait(),
        portrait: (context) => WelcomeScreen(),
        landscape: (context) => NavigationViewMobileLandscape(),
      ),
    );
  }
}
