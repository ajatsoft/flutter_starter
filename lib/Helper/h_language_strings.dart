import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/app_localizations.dart';

class HLanguageStrings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context).translate('home_title'),
        //Strings.homeTitle,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
