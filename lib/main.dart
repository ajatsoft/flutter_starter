import 'package:flutter/material.dart';
import 'package:flutter_starter/Helper/h_flutter_swiper.dart';
import 'package:flutter_starter/Helper/h_http.dart';
import 'package:flutter_starter/bloc/navigation_bloc.dart';
import 'package:flutter_starter/utils/app_theme.dart';
import 'package:flutter_starter/utils/size_config.dart';
import 'package:flutter_starter/utils/strings.dart';
import 'package:flutter_starter/view/custom_appbar.dart';
import 'package:flutter_starter/view/custom_bottom_navigationbar.dart';
import 'package:flutter_starter/view/home/home.dart';
import 'package:flutter_starter/view/video/video.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider<NavigationBloc>.value(
        value: NavigationBloc(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  final List<Widget> navPages = [
    HomeScreen(),
    VideoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final NavigationBloc navigationBloc = Provider.of<NavigationBloc>(context);
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
                bottomNavigationBar: customBottomNavigationBar(),
                body: IndexedStack(
                  index: navigationBloc.selectedIndex,
                  children: navPages,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
