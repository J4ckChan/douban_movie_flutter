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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('预告片',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
              Icon(Icons.arrow_forward_ios,color: Colors.white,),
            ],
          ),
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