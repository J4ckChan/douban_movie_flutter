import 'package:flutter/material.dart';

class DouBanHotMovieCell extends StatefulWidget {

  const DouBanHotMovieCell({
    Key key,
    this.index,
  }):super(key:key);

  final int index;

  @override
  _DouBanHotMovieCellState createState() => _DouBanHotMovieCellState();
}

class _DouBanHotMovieCellState extends State<DouBanHotMovieCell> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width -32)/3.0 - 16,
            height: 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage.assetNetwork(
                placeholder: 'images/sample.jpg',
                image: 'https://img1.doubanio.com/view/photo/l/public/p511146807.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width -32)/3.0 - 16,
            child: Text('海上钢琴师 + $widget.index',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),overflow: TextOverflow.ellipsis,)
          ),
          Container(
            color: Colors.white10,
            width: (MediaQuery.of(context).size.width -32)/3.0 - 16,
            child: Row(
              children: <Widget>[
                Icon(Icons.star,color:Colors.yellow,size:16),
                Icon(Icons.star,color:Colors.yellow,size:16),
                Icon(Icons.star,color:Colors.yellow,size:16),
                Icon(Icons.star,color:Colors.yellow,size:16),
                Icon(Icons.star,color:Colors.white,size:16),
              ],
            ),
          )
        ],
      ),
    );
  }
}