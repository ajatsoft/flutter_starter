import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HCachedNetworkImage extends StatelessWidget {
  final String imageURL =
      'https://images.unsplash.com/photo-1539331914562-acfd435139e5?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: imageURL,
        placeholder: (context, url) => Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fadeInCurve: Curves.easeIn,
        fadeInDuration: Duration(milliseconds: 1000),
        //fit: BoxFit.fill,
        imageBuilder: (context, imageProvider) => Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Hello'),
                Image(
                  image: CachedNetworkImageProvider(
                    imageURL,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
