import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/services/auth.dart';
import 'package:flutter_starter/view/home/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class SignInEmailScreen extends StatelessWidget {
  final AuthBase auth;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInEmailScreen({Key key, this.auth}) : super(key: key);

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  void _submit() async {
    await auth.signInWithEmailAndPassword(_email, _password);
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
                  Icons.close,
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
              controller: _emailController,
            ),
            Padding(
              padding: EdgeInsetsResponsive.symmetric(vertical: 8),
            ),
            CustomTextField(
              controller: _passwordController,
              icon: CupertinoIcons.padlock,
              title: 'Password',
              isPassword: true,
            ),
            Padding(
              padding: EdgeInsetsResponsive.symmetric(vertical: 16),
            ),
            FullWidthButton(
              title: 'Sign In',
              onPressed: _submit,
            ),
            Spacer(),
            OrDivider(),
            Padding(
              padding: EdgeInsetsResponsive.symmetric(vertical: 10),
            ),
            FullWidthButton(
              title: 'Create new account',
              onPressed: () {},
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

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isPassword;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const CustomTextField(
      {Key key,
      this.icon,
      this.title,
      this.isPassword,
      this.onChanged,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(primaryColor: const Color.fromARGB(255, 51, 175, 133)),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: isPassword,
        style: TextStyle(
          fontSize: ResponsiveWidgets.getSize(16),
        ),
        //autofocus: true,
        cursorColor: const Color.fromARGB(255, 51, 175, 133),
        decoration: new InputDecoration(
          contentPadding: EdgeInsetsResponsive.all(0),
          prefixIcon: IconResponsive(
            icon,
            size: 20,
          ),
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          hintStyle: new TextStyle(color: Colors.grey[500]),
          hintText: title,
          fillColor: Colors.grey.withOpacity(0.1),
        ),
      ),
    );
  }
}
