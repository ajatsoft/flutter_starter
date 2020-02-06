import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/app_theme.dart';
import 'package:flutter_starter/utils/size_config.dart';
import 'package:flutter_starter/utils/strings.dart';
import 'package:flutter_starter/view/custom_appbar.dart';
import 'package:flutter_starter/view/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: Strings.appTitle,
              theme: AppTheme.lightTheme,
              home: Scaffold(
                appBar: customAppBar(context),
                body: HomeScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
