import 'package:douban_movie_flutter/Hot/MovieData.dart';
import 'package:flutter/material.dart';

class HotListCell extends StatefulWidget {
  final MovieData movieData;
  HotListCell(this.movieData);
  @override
  _HotListCellState createState() => _HotListCellState();
}

class _HotListCellState extends State<HotListCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Image.network(
            widget.movieData.imageUrls.small,
            width:90,
            height:140,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 16,left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.movieData.title,
                    style: TextStyle(fontWeight:FontWeight.bold,fontSize: 22),
                  ),
                  Text(widget.movieData.rating.average.toString()),
                  Text('导演：'+widget.movieData.directorsStr),
                  Text('演员：'+widget.movieData.castsStr)
                ],
              ),
            )
          ),
          Container(
            constraints: BoxConstraints.tightFor(width: 80),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(widget.movieData.collectCount.toString()+'收藏'),
                OutlineButton(
                  child: Text('购票'),
                  textColor: Colors.red,
                  borderSide: BorderSide(color: Colors.red),
                  onPressed: (){
                    //ToDO:add buy ticket func later
                    print('buy ticket');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

