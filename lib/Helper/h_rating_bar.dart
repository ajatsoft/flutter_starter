import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_starter/utils/images.dart';

class HRatingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return ratingBuilder();
    //return ratingWidget();
    return ratingSmiley();
  }

  RatingBar ratingBuilder() {
    return RatingBar(
      initialRating: 3.2,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.menu,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  RatingBar ratingWidget() {
    return RatingBar(
      initialRating: 3,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: Container(
          height: 5,
          width: 5,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(Images.fullHeart),
              fit: BoxFit.cover,
            ),
          ),
        ),
        half: Container(
          height: 5,
          width: 5,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(Images.halfHeart),
              fit: BoxFit.cover,
            ),
          ),
        ),
        empty: Container(
          height: 5,
          width: 5,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(Images.emptyHeart),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  RatingBar ratingSmiley() {
    return RatingBar(
      initialRating: 3,
      itemCount: 5,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.red,
            );
          case 1:
            return Icon(
              Icons.sentiment_dissatisfied,
              color: Colors.redAccent,
            );
          case 2:
            return Icon(
              Icons.sentiment_neutral,
              color: Colors.amber,
            );
          case 3:
            return Icon(
              Icons.sentiment_satisfied,
              color: Colors.lightGreen,
            );
          case 4:
            return Icon(
              Icons.sentiment_very_satisfied,
              color: Colors.green,
            );
          default:
            return null;
        }
      },
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
