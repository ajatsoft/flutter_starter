import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/strings.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Strings.homeScreenTitle,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
