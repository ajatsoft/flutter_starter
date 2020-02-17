import 'package:flutter/material.dart';
import 'package:flutter_starter/services/auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_widgets/models/responsive_widgets_model.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class SignInScreen extends StatelessWidget {
  final AuthBase auth;

  const SignInScreen({Key key, this.auth}) : super(key: key);

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: _signInAnonymously,
      ),
      body: ContainerResponsive(
        child: Padding(
          padding: EdgeInsetsResponsive.fromLTRB(
              16,
              MediaQuery.of(context).padding.top + 16,
              16,
              MediaQuery.of(context).padding.bottom + 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SvgPicture.asset(
                'images/biscuit.svg',
                height: ResponsiveWidgets.getSize(120),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
