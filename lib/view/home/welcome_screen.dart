import 'package:flutter/material.dart';
import 'package:flutter_starter/services/auth.dart';
import 'package:flutter_starter/view/home/sign_in_email_screen.dart';
import 'package:flutter_starter/view/home/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_widgets/models/responsive_widgets_model.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class WelcomeScreen extends StatefulWidget {
  final AuthBase auth;

  const WelcomeScreen({Key key, this.auth}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Slide> slides = [
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
                  slide: slides[i],
                ),
                controller: _pageController,
                itemCount: slides.length,
                onPageChanged: _onPageChanged,
              ),
            ),
            ContainerResponsive(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    slides.length, (i) => SlideDots(i == _currentPage)),
              ),
            ),
            BottomContainer(
              auth: widget.auth,
            ),
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
          Padding(
            padding: EdgeInsetsResponsive.symmetric(vertical: 8),
          ),
          TextResponsive(
            slide.description,
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsetsResponsive.symmetric(vertical: 16),
          ),
          SvgPicture.asset(
            slide.imageUrl,
            height: MediaQuery.of(context).size.height / 3,
          ),
        ],
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  final AuthBase auth;

  const BottomContainer({Key key, this.auth}) : super(key: key);

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

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
          FullWidthButton(
            title: 'Continue with email',
            toScreen: SignInEmailScreen(),
          ),
          Padding(
            padding: EdgeInsetsResponsive.symmetric(vertical: 8),
          ),
          OrDivider(),
          Padding(
            padding: EdgeInsetsResponsive.symmetric(vertical: 8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              HalfWidthButton(
                title: 'Google',
                imageUrl: 'images/google.svg',
                onPressed: _signInWithGoogle,
              ),
              Padding(
                padding: EdgeInsetsResponsive.symmetric(horizontal: 16),
              ),
              HalfWidthButton(
                title: 'Facebook',
                imageUrl: 'images/fb.svg',
                onPressed: _signInWithFacebook,
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

class SlideDots extends StatelessWidget {
  final bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return ContainerResponsive(
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
