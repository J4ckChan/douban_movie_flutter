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
                                    flex: 5,
                                    child: Container(
                                      height: 100,
                                      color: Colors.blueGrey,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              height: 55,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.purple,
                                              ),
                                              child: Icon(Icons.list,size:40,color:Colors.white),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text("找电影",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                                    Text('科幻/悬疑/剧情',style: TextStyle(fontSize: 14),)
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 8),
                                              child: Icon(Icons.arrow_right),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      height: 100,
                                      color: Colors.cyan,
                                    ),
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