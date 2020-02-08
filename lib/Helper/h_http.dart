import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/size_config.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;

class HHttp extends StatefulWidget {
  @override
  _HHttpState createState() => _HHttpState();
}

class _HHttpState extends State<HHttp> {
  final String url =
      'https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/10/explicit.json';
  List<Result> results;
  Future _loadMessageList() async {
    http.Response response = await http.get(url);

    var content = jsonDecode(response.body);
    AppStore appStore = AppStore.fromJson(content);

    setState(() {
      results = appStore.feed.results;
    });

    results.forEach((i) => print(i.artistName));
  }

  @override
  void initState() {
    _loadMessageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(8),
      height: 200,
      width: double.infinity,
      child: Swiper(
//      itemWidth: 500,
//      itemHeight: 200,
        viewportFraction: 0.6,
        scale: 1,
        loop: false,
        itemCount: results == null ? 0 : results.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image(
              image: CachedNetworkImageProvider(
                results[index].artworkUrl100,
              ),
            ),
          );
        },
      ),
    );
  }
}

/// API Data Model
class AppStore {
  Feed feed;

  AppStore({this.feed});

  AppStore.fromJson(Map<String, dynamic> json) {
    feed = json['feed'] != null ? new Feed.fromJson(json['feed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.feed != null) {
      data['feed'] = this.feed.toJson();
    }
    return data;
  }
}

class Feed {
  String title;
  String id;
  Author author;
  List<Links> links;
  String copyright;
  String country;
  String icon;
  String updated;
  List<Result> results;

  Feed(
      {this.title,
      this.id,
      this.author,
      this.links,
      this.copyright,
      this.country,
      this.icon,
      this.updated,
      this.results});

  Feed.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    if (json['links'] != null) {
      links = new List<Links>();
      json['links'].forEach((v) {
        links.add(new Links.fromJson(v));
      });
    }
    copyright = json['copyright'];
    country = json['country'];
    icon = json['icon'];
    updated = json['updated'];
    if (json['results'] != null) {
      results = new List<Result>();
      json['results'].forEach((v) {
        results.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.map((v) => v.toJson()).toList();
    }
    data['copyright'] = this.copyright;
    data['country'] = this.country;
    data['icon'] = this.icon;
    data['updated'] = this.updated;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Author {
  String name;
  String uri;

  Author({this.name, this.uri});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['uri'] = this.uri;
    return data;
  }
}

class Links {
  String self;
  String alternate;

  Links({this.self, this.alternate});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    alternate = json['alternate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['alternate'] = this.alternate;
    return data;
  }
}

class Result {
  String artistName;
  String id;
  String releaseDate;
  String name;
  String kind;
  String copyright;
  String artistId;
  String artistUrl;
  String artworkUrl100;
  List<Genres> genres;
  String url;
  String contentAdvisoryRating;

  Result(
      {this.artistName,
      this.id,
      this.releaseDate,
      this.name,
      this.kind,
      this.copyright,
      this.artistId,
      this.artistUrl,
      this.artworkUrl100,
      this.genres,
      this.url,
      this.contentAdvisoryRating});

  Result.fromJson(Map<String, dynamic> json) {
    artistName = json['artistName'];
    id = json['id'];
    releaseDate = json['releaseDate'];
    name = json['name'];
    kind = json['kind'];
    copyright = json['copyright'];
    artistId = json['artistId'];
    artistUrl = json['artistUrl'];
    artworkUrl100 = json['artworkUrl100'];
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
    url = json['url'];
    contentAdvisoryRating = json['contentAdvisoryRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artistName'] = this.artistName;
    data['id'] = this.id;
    data['releaseDate'] = this.releaseDate;
    data['name'] = this.name;
    data['kind'] = this.kind;
    data['copyright'] = this.copyright;
    data['artistId'] = this.artistId;
    data['artistUrl'] = this.artistUrl;
    data['artworkUrl100'] = this.artworkUrl100;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    data['url'] = this.url;
    data['contentAdvisoryRating'] = this.contentAdvisoryRating;
    return data;
  }
}

class Genres {
  String genreId;
  String name;
  String url;

  Genres({this.genreId, this.name, this.url});

  Genres.fromJson(Map<String, dynamic> json) {
    genreId = json['genreId'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genreId'] = this.genreId;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

/// End of API Data Model
