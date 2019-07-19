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
                                    child: ButtonWithDouBanStyle1(
                                        onPressed:(){
                                          print('object');
                                        },
                                        icon:Icons.list,
                                        title:'找电影',
                                        subTitle:'科幻/悬疑/犯罪'
                                      ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: ButtonWithDouBanStyle1(
                                        onPressed:(){
                                          print('object1');
                                        },
                                        icon:Icons.collections, 
                                        title:'我的影视' ,
                                        subTitle: '700多部',
                                        iconBackgroundColor: Colors.pinkAccent,
                                      )
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20,left: 20,top:20),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(child: Text('豆瓣热门',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                                    Text('全部99+'),
                                    Icon(Icons.arrow_right),
                                  ],
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

