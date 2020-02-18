import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class FullWidthButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double elevation;
  final Color textColor;

  const FullWidthButton(
      {Key key,
      this.title,
      this.onPressed,
      this.backgroundColor = const Color.fromARGB(255, 51, 175, 133),
      this.elevation = 3,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightElevation: 0,
      elevation: elevation,
      child: TextResponsive(
        title,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ResponsiveWidgets.getSize(8)),
      ),
      padding: EdgeInsetsResponsive.all(16),
      color: backgroundColor,
      textColor: textColor,
      onPressed: onPressed,
    );
  }
}

class HalfWidthButton extends StatelessWidget {
  final String imageUrl;
  final String title;

  const HalfWidthButton({Key key, this.imageUrl, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        splashColor: Colors.transparent,
        highlightElevation: 0,
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

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isPassword;

  const CustomTextField(
      {Key key, this.icon, this.title, this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(primaryColor: const Color.fromARGB(255, 51, 175, 133)),
      child: TextField(
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

class VPadding extends StatelessWidget {
  final double value;

  const VPadding(this.value);
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsResponsive.symmetric(vertical: value));
  }
}

class HPadding extends StatelessWidget {
  final double value;

  const HPadding(this.value);
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsResponsive.symmetric(horizontal: value));
  }
}
