import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/strings.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Strings.videoTitle,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
