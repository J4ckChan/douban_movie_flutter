import 'dart:convert' as convert;
import 'package:douban_movie_flutter/Hot/MovieData.dart';
import 'package:douban_movie_flutter/Search/DouBanHotMovieCell.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DouBanHotMovie extends StatefulWidget {
  @override
  _DouBanHotMovieState createState() => _DouBanHotMovieState();
}

class _DouBanHotMovieState extends State<DouBanHotMovie> {

  List<MovieData> hotMovieWeekly = new List();

  @override
  void initState() {
    super.initState();
    requestHotMoviesWeekly();
  }

  Future requestHotMoviesWeekly() async {
    List<MovieData> hotMovieWeekly = new List();
    var response = await http.get('https://api.douban.com/v2/movie/weekly?apikey=0b2bdeda43b5688921839c8ecb20399b');

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (dynamic item in jsonResponse["subjects"]) {
        MovieData movieData = MovieData.fromJson(item['subject']);
        hotMovieWeekly.add(movieData);
      }
      setState(() {
        this.hotMovieWeekly = hotMovieWeekly;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8,left: 16,right: 16),
      child: Container(
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context,index){
            if (this.hotMovieWeekly == null || this.hotMovieWeekly.isEmpty){
              return DouBanHotMovieCell(hasMovieData: false,);
            }else{
              return DouBanHotMovieCell(movieData: this.hotMovieWeekly[index],);
            }
          },
        ),
      ),
    );
  }
} 