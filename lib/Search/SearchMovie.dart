import 'package:douban_movie_flutter/Component/Button/ButtonWithDouBanStyle1.dart';
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
                                height: 140,
                                color: Colors.pink,
                                child: Center(
                                  child: Text('ad',style: TextStyle(color: Colors.black),),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    flex: 8,
                                    child: ButtonWithDouBanStyle1(Icons.list,'找电影','科幻/悬疑/犯罪'),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: ButtonWithDouBanStyle1(Icons.collections, '我的影视' , '700多部',iconBackgroundColor: Colors.pinkAccent,)
                                  )
                                ],
                              )
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

