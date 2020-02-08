import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

class HFabCircularMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
      child: Center(
        child: Text(
          'Fab Circular Demo',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      options: <Widget>[
        //FloatingActionButton
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            print(123);
          },
        ),
      ],
      //ringColor: Theme.of(context).bottomAppBarTheme.color,
      fabColor: Theme.of(context).floatingActionButtonTheme.foregroundColor,
      ringColor: Theme.of(context).primaryColor,
      animationDuration: Duration(milliseconds: 800),
      onDisplayChange: (isOpen) {},
      fabOpenIcon: Icon(
        Icons.menu,
        color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
      ),
    );
  }
}
