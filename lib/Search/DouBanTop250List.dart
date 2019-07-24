import 'package:douban_movie_flutter/Hot/MovieData.dart';
import 'package:douban_movie_flutter/Search/DouBanTop250Cell.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DouBanTop250List extends StatefulWidget {
  @override
  _DouBanTop250ListState createState() => _DouBanTop250ListState();
}

class _DouBanTop250ListState extends State<DouBanTop250List> {

  List<MovieData> top250Movie = List();

  @override
  void initState() {
    super.initState();
    requestDouBanTop250Moive();
  }

  Future requestDouBanTop250Moive() async {
    List<MovieData> top250Movie = List();
    var response = await http.get('https://api.douban.com/v2/movie/top250?apikey=0b2bdeda43b5688921839c8ecb20399b&start=0&count=5');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (dynamic item in jsonResponse['subjects']) {
        MovieData movieData = MovieData.fromJson(item);
        top250Movie.add(movieData);
      }
    } else {
      print(response.statusCode);
    }
    setState(() {
      this.top250Movie = top250Movie;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (top250Movie == null || top250Movie.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
    return  Padding(
      padding: EdgeInsets.only(top:16,left: 16,right: 16),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text('豆瓣电影 Top250',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          ),
          Container(
            height: 80.0*5,
            child: ListView.separated(
              padding: const EdgeInsets.all(0),
              itemCount: 5,
              itemBuilder: (context,index){
                return DouBanTop250Cell(index: index,moiveData: top250Movie[index],);
              },
              separatorBuilder: (context,index){
                return Container(
                  constraints: BoxConstraints.tightFor(height: 1),
                  color: Colors.black26,
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: BorderDirectional(
                top: BorderSide(width: 1,color: Colors.black26),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:4.0),
              child: Center(
                child: Text('全部250部'),
              ),
            ),
          ),
        ],
      ),
    );
  }
  }
}

