import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
import 'package:douban_movie_flutter/MovieDetail/MovieDetailWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<MovieDetailData> fetchMovieDetail(http.Client client,String id) async {
    String url = 'https://api.douban.com/v2/movie/subject/'+id+'?apikey=0b2bdeda43b5688921839c8ecb20399b';
    final response = await client.get(url);

    return parseMoieDetail(response.body);
  }

  MovieDetailData parseMoieDetail(String responseBody) {
  final parsed = json.decode(responseBody);

  return MovieDetailData.fromJson(parsed);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[700],
      appBar: AppBar(title: Text('电影'),backgroundColor: Colors.redAccent[700],),
      body: FutureBuilder<MovieDetailData>(
        future: fetchMovieDetail(http.Client(), widget.id),
        builder: (context,snapshot){
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData 
          ? MovieDetailWidget(movieDetailData: snapshot.data,)
          :Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}