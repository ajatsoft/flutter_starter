import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/services/auth.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class HomeScreen extends StatelessWidget {
  final AuthBase auth;

  const HomeScreen({Key key, this.auth}) : super(key: key);

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextResponsive(
          'Home',
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: _signOut,
            child: TextResponsive(
              'Logout',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
