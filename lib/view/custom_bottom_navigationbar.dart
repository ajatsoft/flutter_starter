import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/bloc/navigation_bloc.dart';
import 'package:provider/provider.dart';

Widget customBottomNavigationBar() {
  //return CustomCurvedBottomNavigationBar(),
  return CustomDefaultBottomNavBar();
}

/// Default Flutter Navigation Bar
class CustomDefaultBottomNavBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items = [];

  CustomDefaultBottomNavBar() {
    items.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
      ),
    );
    items.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.ondemand_video),
        title: Text('Video'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final NavigationBloc navigationBloc = Provider.of<NavigationBloc>(context);
    return BottomNavigationBar(
      onTap: (index) {
        navigationBloc.selectedIndex = index;
      },
      currentIndex: navigationBloc.selectedIndex,
      items: items,
      type: BottomNavigationBarType.fixed,
    );
  }
}

/// Curved Bottom Navigation Bar
class CustomCurvedBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigationBloc navigationBloc = Provider.of<NavigationBloc>(context);

    return CurvedNavigationBar(
      //color: Colors.black,
      backgroundColor: Colors.black,
      items: <Widget>[
        BottomNavigationBarIcon(icon: Icons.home),
        BottomNavigationBarIcon(icon: Icons.ondemand_video),
      ],
      onTap: (index) {
        navigationBloc.selectedIndex = index;
      },
    );
  }
}

class BottomNavigationBarIcon extends StatelessWidget {
  final IconData icon;

  BottomNavigationBarIcon({this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Colors.black,
    );
  }
}
