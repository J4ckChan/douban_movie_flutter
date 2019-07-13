import 'package:douban_movie_flutter/Hot/HotWidget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣电影',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: '豆瓣电影'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: 0,
        items:[
          BottomNavigationBarItem(icon:Icon(Icons.movie),title: Text('热映')),
          BottomNavigationBarItem(icon:Icon(Icons.search),title: Text('找片')),
          BottomNavigationBarItem(icon:Icon(Icons.person),title: Text('我的')),
        ],
        fixedColor: Theme.of(context).primaryColor,
      ),
      body: HotWidget(),
    );
  }
}
