import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Slide> slideList = [
    Slide(
        imageUrl: 'images/1.svg',
        title: 'Welcome',
        description:
            'Develop your course study plan according to your hobbies and escort your study'),
    Slide(
        imageUrl: 'images/2.svg',
        title: 'Welcome',
        description:
            'Targeted learning, reasonable arrangement for your study'),
    Slide(
        imageUrl: 'images/3.svg',
        title: 'Welcome',
        description: 'Learning situation, every stage is clear\n'),
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top +
                  ResponsiveWidgets.getSize(16),
            ),
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) => SlideItem(
                  slide: slideList[i],
                ),
                controller: _pageController,
                itemCount: slideList.length,
                onPageChanged: _onPageChanged,
              ),
            ),
            ContainerResponsive(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < slideList.length; i++)
                    if (i == _currentPage) SlideDots(true) else SlideDots(false)
                ],
              ),
            ),
            BottomContainer(),
          ],
        ),
      ),
    );
  }
}

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({this.imageUrl, this.title, this.description});
}

class SlideItem extends StatelessWidget {
  final Slide slide;

  const SlideItem({Key key, this.slide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsResponsive.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextResponsive(
            slide.title,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: ResponsiveWidgets.getSize(16),
          ),
          TextResponsive(
            slide.description,
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: ResponsiveWidgets.getSize(32),
          ),
          SvgPicture.asset(
            slide.imageUrl,
            height: MediaQuery.of(context).size.height / 4,
          ),
        ],
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsResponsive.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextResponsive(
            'Login and registration are free',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsetsResponsive.symmetric(vertical: 8),
          ),
          MaterialButton(
            elevation: 5,
            child: TextResponsive(
              'Continue with email',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ResponsiveWidgets.getSize(8)),
            ),
            padding: EdgeInsetsResponsive.all(16),
            color: const Color.fromARGB(255, 51, 175, 133),
            textColor: Colors.white,
            onPressed: () {},
          ),
          Padding(
            padding: EdgeInsetsResponsive.symmetric(vertical: 8),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Divider(
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
              TextResponsive(
                '    OR    ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsResponsive.symmetric(vertical: 8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomLoginButton(
                title: 'Google',
                imageUrl: 'images/google.svg',
              ),
              Padding(
                padding: EdgeInsetsResponsive.symmetric(horizontal: 16),
              ),
              CustomLoginButton(
                title: 'Facebook',
                imageUrl: 'images/fb.svg',
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom + 16,
          ),
        ],
      ),
    );
  }
}

class CustomLoginButton extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CustomLoginButton({Key key, this.imageUrl, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              imageUrl,
              height: MediaQuery.of(context).size.width / 16,
            ),
            Padding(
              padding: EdgeInsetsResponsive.symmetric(horizontal: 8),
            ),
            TextResponsive(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ResponsiveWidgets.getSize(8)),
          side: BorderSide(width: 1, color: Colors.grey[350]),
        ),
        padding: EdgeInsetsResponsive.all(16),
        //color: const Color.fromARGB(255, 51, 175, 133),
        onPressed: () {},
      ),
    );
  }
}

class SlideDots extends StatelessWidget {
  final bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
      //duration: Duration(milliseconds: 0),
      //padding: EdgeInsetsResponsive.symmetric(horizontal: 8),
      margin: EdgeInsetsResponsive.symmetric(horizontal: 8, vertical: 16),
      height: isActive ? 8 : 4,
      width: isActive ? 32 : 16,
      heightResponsive: true,
      widthResponsive: true,
      decoration: BoxDecoration(
        color: isActive ? const Color.fromARGB(255, 51, 175, 133) : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}
