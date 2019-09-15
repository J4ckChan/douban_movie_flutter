import 'package:douban_movie_flutter/Component/HeaderWithArrow.dart';
import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
import 'package:flutter/material.dart';

class TrailersListView extends StatelessWidget {
  const TrailersListView({
    Key key,
    @required this.movieDetailData,
  }) : super(key: key);

  final MovieDetailData movieDetailData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:16.0,right: 16.0,top: 8.0),
      child: Column(
        children: <Widget>[
          HeaderWithArrow(title: '预告片',),
          Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: this.movieDetailData.trailers.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: FadeInImage.assetNetwork(
                      height: 120,
                      width: 260,
                      fit: BoxFit.fill,
                      placeholder: 'images/image_placeholder.png',
                      image: this.movieDetailData.trailers[index].medium,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}