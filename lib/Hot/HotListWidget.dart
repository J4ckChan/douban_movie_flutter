import 'dart:convert' as convert;

import 'package:douban_movie_flutter/Hot/HotListCell.dart';
import 'package:douban_movie_flutter/Hot/MovieData.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HotListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotListWidgetState();
  }
}

class HotListWidgetState extends State<HotListWidget> with AutomaticKeepAliveClientMixin {

  String _curCity;
  List<MovieData> _movieDataList;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _curCity = '杭州';
    requestHotMovieListWithCity(_curCity);  
  }

  Future requestHotMovieListWithCity(String city) async {
    List<MovieData> hotMovieList = new List();
    var url = 'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=' + city + '&start=0&count=10';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      for (dynamic data in jsonResponse['subjects']) {
        MovieData movieItem = MovieData.fromJson(data);
        hotMovieList.add(movieItem);
      }
      setState(() {
        _movieDataList = hotMovieList;
      });
    } else {
      print('Request failed with State Code:${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_movieDataList == null || _movieDataList.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: _movieDataList.length,
        separatorBuilder: (context,index) => const Divider(color: Colors.black45,height: 1,),
        itemBuilder: (context,index){
          return HotListCell(_movieDataList[index]);
        },
      );
    }
  }
}