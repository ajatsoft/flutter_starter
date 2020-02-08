import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/app_localizations.dart';
import 'package:flutter_starter/utils/strings.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context).translate('video_title'),
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
