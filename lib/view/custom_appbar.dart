import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(0),
    child: AppBar(
      backgroundColor: Theme.of(context).appBarTheme.color,
      elevation: 0,
      title: null,
    ),
  );
}
