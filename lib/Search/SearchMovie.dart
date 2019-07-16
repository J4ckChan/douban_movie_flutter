import 'package:flutter/material.dart';

class SearchMovie extends StatefulWidget {
  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 44,left: 8,right: 8),
          child: Container(
            height: 60,
            child: TextField(
              decoration: InputDecoration(
                hintText: '电影/电视剧/影人',
                prefixIcon: Icon(Icons.search),
                filled: true,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 0),
            child: DefaultTabController(
              length: 2,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      child: TabBar(
                        tabs: <Widget>[
                          Text('电影',style: TextStyle(color: Colors.black),),
                          Text('电视剧',style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                height: 120,
                                color: Colors.grey,
                                child: Center(
                                  child: Text('moive',style: TextStyle(color: Colors.black),),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Text('tv',style: TextStyle(color: Colors.black),),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ),
          ),
        )
      ],
    );
  }
}