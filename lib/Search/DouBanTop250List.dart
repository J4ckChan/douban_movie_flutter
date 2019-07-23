import 'package:douban_movie_flutter/Search/DouBanTop250Cell.dart';
import 'package:flutter/material.dart';

class DouBanTop250List extends StatefulWidget {
  @override
  _DouBanTop250ListState createState() => _DouBanTop250ListState();
}

class _DouBanTop250ListState extends State<DouBanTop250List> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(top:16,left: 16,right: 16),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.purple,
            alignment: Alignment.centerLeft,
            child: Text('豆瓣电影 Top250',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          ),
          Container(
            color: Colors.yellow,
            height: 76.0*5,
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: 5,
              itemBuilder: (context,index){
                return DouBanTop250Cell(index: index,);
              },
            ),
          )
        ],
      ),
    );
  }
}

