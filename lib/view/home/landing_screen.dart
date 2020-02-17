import 'package:flutter/material.dart';
import 'package:flutter_starter/services/auth.dart';
import 'package:flutter_starter/view/home/home_screen.dart';
import 'package:flutter_starter/view/home/sign_in_screen.dart';

class LadingScreen extends StatelessWidget {
  final AuthBase auth;

  const LadingScreen({Key key, this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return SignInScreen(
              auth: auth,
            );
          }
          return HomeScreen(
            auth: auth,
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
