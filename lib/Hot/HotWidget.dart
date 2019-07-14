import 'package:douban_movie_flutter/Hot/HotListWidget.dart';
import 'package:flutter/material.dart';

class HotWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotWidgetState();
  }
}

class HotWidgetState extends State<HotWidget> {
  String _curCity = '杭州';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 80,
          padding: EdgeInsets.only(left: 8,right: 8),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                child:Row(
                  children: <Widget>[
                    Text(_curCity),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                onPressed: (){
                  _jumpToSelectCtiy();
                },
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    //prefixIcon: Icon(Icons.search),
                    hintText: 'Search Movie & TV Series',
                    filled: true,
                    contentPadding: EdgeInsets.only(top: 8,bottom: 8),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              )
            ],
          )
        ),
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.tightFor(height: 50),
                  child:TabBar(
                    tabs: <Widget>[
                      Text('正在热映',style: TextStyle(color: Colors.lightBlue,fontSize: 16),),
                      Text('即将上映',style: TextStyle(color: Colors.lightBlue,fontSize: 16),),
                    ],
                  ),
                ),
                Expanded(
                  child:TabBarView(
                    children: <Widget>[
                      HotListWidget(),
                      Center(
                        child: Text('coming soon'),
                      )
                    ],
                  ) ,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _jumpToSelectCtiy() async {
    var selectedCity = await Navigator.pushNamed(context, '/city',arguments: _curCity);
    if (selectedCity!= null ) {
      setState(() {
        _curCity = selectedCity;
      });
    } 
  }
}