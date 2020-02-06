import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/app_theme.dart';
import 'package:flutter_boilerplate/utils/size_config.dart';
import 'package:flutter_boilerplate/utils/strings.dart';
import 'package:flutter_boilerplate/view/custom_appbar.dart';
import 'package:flutter_boilerplate/view/home/home.dart';

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
              theme: AppTheme.darkTheme,
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
