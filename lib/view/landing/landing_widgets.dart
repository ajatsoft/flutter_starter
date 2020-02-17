import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class FullWidthButton extends StatelessWidget {
  final String title;
  final Widget screen;
  final Color backgroundColor;
  final double elevation;
  final Color textColor;

  const FullWidthButton(
      {Key key,
      this.title,
      this.screen,
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
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
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
