import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/view/landing/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_widgets/models/responsive_widgets_model.dart';
import 'package:responsive_widgets/widgets/edge_insets_responsive.dart';
import 'package:responsive_widgets/widgets/text_responsive_widget.dart';

class CreateEmailScreen extends StatelessWidget {
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
            SvgPicture.asset(
              'images/4.svg',
              height: MediaQuery.of(context).size.width / 4,
            ),
            VPadding(8),
            TextResponsive(
              'Create account',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            VPadding(4),
            TextResponsive(
              'After registering, You can start a career with these simple steps',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            VPadding(16),
            CustomTextField(
              icon: CupertinoIcons.person,
              title: 'Username',
            ),
            VPadding(8),
            CustomTextField(
              icon: CupertinoIcons.mail,
              title: 'Email',
            ),
            VPadding(8),
            CustomTextField(
              icon: CupertinoIcons.padlock,
              title: 'password',
              isPassword: true,
            ),
            VPadding(16),
            FullWidthButton(
              title: 'Sign Up',
              onPressed: () {},
            ),
            //VPadding(16),
            Spacer(),
            Divider(),
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: TextResponsive(
                'Already have an account?',
                style: TextStyle(
                  color: const Color.fromARGB(255, 51, 175, 133),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
