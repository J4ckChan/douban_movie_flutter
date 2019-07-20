import 'package:douban_movie_flutter/Search/DouBanHotMovieCell.dart';
import 'package:flutter/material.dart';

class DouBanHotMovie extends StatefulWidget {
  @override
  _DouBanHotMovieState createState() => _DouBanHotMovieState();
}

class _DouBanHotMovieState extends State<DouBanHotMovie> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8,left: 16,right: 16),
      child: Container(
        height: 240,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context,index){
            return DouBanHotMovieCell(index: index,);
          },
        ),
      ),
    );
  }
}