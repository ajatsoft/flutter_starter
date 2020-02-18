import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_starter/utils/app_localizations.dart';
import 'package:flutter_starter/utils/app_theme.dart';
import 'package:flutter_starter/utils/strings.dart';
import 'package:flutter_starter/view/navigation_view.dart';
import 'package:responsive_widgets/models/responsive_widgets_model.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}

//void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(context);
    return ResponsiveWidgets.builder(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.of(context).locale,
        builder: DevicePreview.appBuilder,
        title: Strings.appTitle,
        //theme: AppTheme.lightTheme,
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('ja', 'JP'),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
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
          return retLocale;
        },
        home: NavigationView(),
      ),
    );
  }
}
