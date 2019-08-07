import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MovieDetail extends StatefulWidget {
  
  MovieDetail({
    Key key,
    @required this.id,
  }) : super (key :key);

  final String id;

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {

  MovieDetailData movieDetailData;

  @override
  void initState() {
    super.initState();
    requestMovieDetail(widget.id);
  }

  Future requestMovieDetail(String id) async {
    String url = 'https://api.douban.com/v2/movie/subject/'+id+'?apikey=0b2bdeda43b5688921839c8ecb20399b';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      MovieDetailData movieDetailData = MovieDetailData.fromJson(jsonResponse);
      setState(() {
        this.movieDetailData = movieDetailData;
      });
    } else {
      print('Request failed with State Code:${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('🎬电影'),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 320,
              color: Theme.of(context).accentColor,
            )
          ],
        ),
      ),
    );
  }
}