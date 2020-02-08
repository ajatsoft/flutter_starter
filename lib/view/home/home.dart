import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/app_localizations.dart';
import 'package:flutter_starter/utils/strings.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        buildTranslate(context),
        //Strings.homeTitle,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  String buildTranslate(BuildContext context) =>
      AppLocalizations.of(context).translate('home_title');
}
