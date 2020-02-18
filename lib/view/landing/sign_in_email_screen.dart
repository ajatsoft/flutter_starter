import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/view/landing/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'create_email_screen.dart';

class SignInEmailScreen extends StatelessWidget {
  void _createEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => CreateEmailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsetsResponsive.fromLTRB(
            16,
            MediaQuery.of(context).padding.top,
            16,
            MediaQuery.of(context).padding.bottom + 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: ResponsiveWidgets.getSize(32),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SvgPicture.asset(
              'images/avatar.svg',
              height: MediaQuery.of(context).size.width / 6,
            ),
            Padding(
              padding: EdgeInsetsResponsive.symmetric(vertical: 8),
            ),
            TextResponsive(
              'Welcome',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsetsResponsive.symmetric(vertical: 4),
            ),
            TextResponsive(
              'After registering, You can start a career with these simple steps',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsetsResponsive.symmetric(vertical: 16),
            ),
            CustomTextField(
              icon: CupertinoIcons.mail,
              title: 'Email address',
              isPassword: false,
            ),
            Padding(
              padding: EdgeInsetsResponsive.symmetric(vertical: 8),
            ),
            CustomTextField(
              icon: CupertinoIcons.padlock,
              title: 'Password',
              isPassword: true,
            ),
            Padding(
              padding: EdgeInsetsResponsive.symmetric(vertical: 16),
            ),
            FullWidthButton(
              title: 'Sign In',
              onPressed: () {},
            ),
            Spacer(),
            OrDivider(),
            Padding(
              padding: EdgeInsetsResponsive.symmetric(vertical: 10),
            ),
            FullWidthButton(
              title: 'Create new account',
              onPressed: () => _createEmail(context),
              backgroundColor:
                  const Color.fromARGB(255, 51, 175, 133).withOpacity(0.15),
              elevation: 0,
              textColor: const Color.fromARGB(255, 51, 175, 133),
            ),
          ],
        ),
      ),
    );
  }
}
