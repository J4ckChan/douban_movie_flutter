import 'dart:convert' as convert;

import 'package:douban_movie_flutter/Hot/MovieData.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HotListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class HotListWidgetState extends State<HotListWidget> {

  String _curCity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _curCity = '杭州';
    requestHotMovieListWithCity(_curCity);  
  }

  Future<List<MovieData>> requestHotMovieListWithCity(String city) async {
    List<MovieData> moiveDataList = new List();
    var url = 'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=' +
            city + '&start=0&count=10';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (dynamic data in jsonResponse['subjects']) {
        MovieData hotMovieData = MovieData.fromJson(data);
        moiveDataList.add(hotMovieData);
      }
    } else {
      print('Request failed with State Code:${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}