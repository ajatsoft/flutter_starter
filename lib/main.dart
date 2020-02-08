import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_starter/bloc/navigation_bloc.dart';
import 'package:flutter_starter/utils/app_localizations.dart';

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
              // List all of the app's supported locales here
              supportedLocales: [
                const Locale('en', 'US'),
                const Locale('ja', 'JP'),
              ],
              // These delegates make sure that the localization data for the proper language is loaded
              localizationsDelegates: [
                // A class which loads the translations from JSON files
                AppLocalizations.delegate,
                // Built-in localization of basic text for Material widgets
                GlobalMaterialLocalizations.delegate,
                // Built-in localization for text direction LTR/RTL
                GlobalWidgetsLocalizations.delegate,
              ],
              // Returns a locale which will be used by the app
              localeResolutionCallback: (locale, supportedLocales) {
                var retLocale = supportedLocales.first;
                if (locale != null) {
                  for (var supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode == locale.languageCode) {
                      retLocale = supportedLocale;
                      if (supportedLocale.countryCode == locale.countryCode) {
                        break;
                      }
                    }
                  }
                }
                // Check if the current device locale is supported

                // If the locale of the device is not supported, use the first one
                // from the list (English, in this case).
                return retLocale;
              },
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
