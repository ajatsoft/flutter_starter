import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_widgets/models/responsive_widgets_model.dart';
import 'package:responsive_widgets/widgets/edge_insets_responsive.dart';
import 'package:responsive_widgets/widgets/text_responsive_widget.dart';

class HalfWidthButton extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function onPressed;

  const HalfWidthButton({Key key, this.imageUrl, this.title, this.onPressed})
      : super(key: key);

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
        onPressed: onPressed,
      ),
    );
  }
}
