import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreenSliverScrollView extends StatelessWidget {
  final int selectedIndex = 1;

  Future<void> _signInAnonymously() async {
    final authResult = await FirebaseAuth.instance.signInAnonymously();
    print('${authResult.user.uid}');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              floating: true,
              delegate: AppHeader(
                minExtent: 0.0,
                maxExtent: ResponsiveWidgets.getSize(
                    56 + MediaQuery.of(context).padding.top),
              ),
            ),
            SliverToBoxAdapter(
              child: ContainerResponsive(
                padding: EdgeInsetsResponsive.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 16,
                    ),
                    TextResponsive(
                      'Unsplash',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextResponsive(
                      'Amazing & beautiful Free photos',
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Theme(
                      data: ThemeData(
                        primaryColor: Colors.green,
                        primarySwatch: Colors.green,
                        scaffoldBackgroundColor: Colors.red,
                      ),
                      child: TextField(
                        style: Theme.of(context).textTheme.body1,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey[350],
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          hintText: 'Search photos',
                          hintStyle: Theme.of(context).textTheme.body2,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TabBarButton(
                          title: 'Travelling',
                          isSelected: selectedIndex == 0,
                          onTabTap: _signInAnonymously,
                        ),
                        TabBarButton(
                          title: 'Nature',
                          isSelected: selectedIndex == 1,
                          onTabTap: () {
                            //onTabTap(1);
                          },
                        ),
                        TabBarButton(
                          title: 'Technology',
                          isSelected: selectedIndex == 2,
                          onTabTap: () {
                            //onTabTap(2);
                          },
                        ),
                        TabBarButton(
                          title: 'Photography',
                          isSelected: selectedIndex == 3,
                          onTabTap: () {
                            //onTabTap(3);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding:
                  EdgeInsetsResponsive.only(left: 16, right: 16, bottom: 16),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.teal[100 * (index % 9)],
                      child: Text('grid item $index'),
                    );
                  },
                  childCount: 30,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 2.0,
                ),
              ),
            ),
          ],
        ),
        ContainerResponsive(
          height: MediaQuery.of(context).padding.top,
          color: Colors.white,
        ),
      ],
    );
  }
}

class AppHeader implements SliverPersistentHeaderDelegate {
  AppHeader({
    this.minExtent,
    @required this.maxExtent,
  });

  final double minExtent;
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ContainerResponsive(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: ResponsiveWidgets.getSize(0.05),
              ),
            ],
            color: Colors.white,
          ),
        ),
        Positioned(
          left: ResponsiveWidgets.getSize(16),
          bottom: ResponsiveWidgets.getSize(12),
          child: IconResponsive(
            Icons.menu,
            size: 32,
          ),
        ),
        Positioned(
          // left: SizeConfig.widthMultiplier * 4,
          right: ResponsiveWidgets.getSize(16),
          bottom: ResponsiveWidgets.getSize(8),
          child: CircleAvatar(
            radius: ResponsiveWidgets.getSize(20),
            backgroundImage: AssetImage('images/pp.jpg'),
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    );
  }

  double titleOpacity(double shrinkOffset) {
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}

class TabBarButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final Function onTabTap;

  const TabBarButton({Key key, this.isSelected, this.title, this.onTabTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTabTap,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ContainerResponsive(
                  decoration: isSelected
                      ? BoxDecoration(
                          border: new Border.all(
                            color: Colors.green.withOpacity(0.5),
                            width: 1,
                          ),
                          shape: BoxShape.circle,
                        )
                      : null),
              SizedBox(
                width: 16,
              ),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 100),
                style: isSelected
                    ? Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontWeight: FontWeight.bold)
                    : Theme.of(context)
                        .textTheme
                        .body2
                        .copyWith(color: Colors.grey[500]),
                child: TextResponsive(
                  '$title',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
          Text(''),
        ],
      ),
    );
  }
}
