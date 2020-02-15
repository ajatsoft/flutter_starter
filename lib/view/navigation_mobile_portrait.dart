import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/app_localizations.dart';
import 'package:flutter_starter/view/home/home_screen_sliver_scrollview.dart';

import 'package:responsive_widgets/responsive_widgets.dart';

class NavigationViewMobilePortrait extends StatefulWidget {
  @override
  _NavigationViewMobilePortrait createState() =>
      _NavigationViewMobilePortrait();
}

class _NavigationViewMobilePortrait
    extends State<NavigationViewMobilePortrait> {
  int _currentIndex = 0;

  final homeKey = GlobalKey<NavigatorState>();
  final exploreKey = GlobalKey<NavigatorState>();
  final favoriteKey = GlobalKey<NavigatorState>();
  final personKey = GlobalKey<NavigatorState>();
  final settingsKey = GlobalKey<NavigatorState>();

  void _onTap(int val, BuildContext context) {
    if (_currentIndex == val) {
      switch (val) {
        case 0:
          homeKey.currentState.popUntil((route) => route.isFirst);
          break;
        case 1:
          favoriteKey.currentState.popUntil((route) => route.isFirst);
          break;
        case 2:
          exploreKey.currentState.popUntil((route) => route.isFirst);
          break;
        case 3:
          personKey.currentState.popUntil((route) => route.isFirst);
          break;
        case 4:
          settingsKey.currentState.popUntil((route) => route.isFirst);
          break;
        default:
      }
    } else {
      if (mounted) {
        setState(() {
          _currentIndex = val;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsetsResponsive.only(
                bottom: 49 + MediaQuery.of(context).padding.bottom),
            child: IndexedStack(
              index: _currentIndex,
              children: <Widget>[
                Navigator(
                  key: homeKey,
                  onGenerateRoute: (route) => MaterialPageRoute(
                    settings: route,
                    builder: (context) => HomeScreenSliverScrollView(),
                  ),
                ),
                Navigator(
                  key: exploreKey,
                  onGenerateRoute: (route) => MaterialPageRoute(
                    settings: route,
                    builder: (context) => Container(
                      color: Colors.green,
                    ),
                  ),
                ),
                Navigator(
                  key: favoriteKey,
                  onGenerateRoute: (route) => MaterialPageRoute(
                    settings: route,
                    builder: (context) => Container(
                      color: Colors.blue,
                    ),
                  ),
                ),
                Navigator(
                  key: personKey,
                  onGenerateRoute: (route) => MaterialPageRoute(
                    settings: route,
                    builder: (context) => Container(
                      color: Colors.purple,
                    ),
                  ),
                ),
                Navigator(
                  key: settingsKey,
                  onGenerateRoute: (route) => MaterialPageRoute(
                    settings: route,
                    builder: (context) => Container(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: ContainerResponsive(
              child: Row(
                children: <Widget>[
                  CustomBottomNavigationBarItem(
                    icon: Icons.home,
                    isSelected: _currentIndex == 0,
                    onTap: () => _onTap(0, context),
                  ),
                  CustomBottomNavigationBarItem(
                    icon: Icons.explore,
                    isSelected: _currentIndex == 1,
                    onTap: () => _onTap(1, context),
                  ),
                  CustomBottomNavigationBarItem(
                    icon: Icons.favorite,
                    isSelected: _currentIndex == 2,
                    onTap: () => _onTap(2, context),
                  ),
                  CustomBottomNavigationBarItem(
                    icon: Icons.person,
                    isSelected: _currentIndex == 3,
                    onTap: () => _onTap(3, context),
                  ),
                  CustomBottomNavigationBarItem(
                    icon: Icons.settings,
                    isSelected: _currentIndex == 4,
                    onTap: () => _onTap(4, context),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: ResponsiveWidgets.getSize(0.5),
                  ),
                ],
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavigationBarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function onTap;

  const CustomBottomNavigationBarItem(
      {Key key, this.icon, this.isSelected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: ContainerResponsive(
          color: Colors.transparent,
          height: 49 + MediaQuery.of(context).padding.bottom,
          heightResponsive: true,
          child: Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            child: IconResponsive(
              icon,
              size: 32,
              color: isSelected ? Colors.green : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
