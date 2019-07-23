import 'package:douban_movie_flutter/Hot/MovieData.dart';
import 'package:flutter/material.dart';

class DouBanTop250Cell extends StatelessWidget {

  const DouBanTop250Cell({
    Key key,
    @required this.moiveData,
    @required this.index,
  }) : super(key: key);

  final MovieData moiveData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${this.index+1}'),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              width: 45,
	            height: 60,
	            child: ClipRRect(
		            borderRadius: BorderRadius.circular(4),
		            child: FadeInImage.assetNetwork(
		              placeholder: 'images/suggestion_on_discovery.png',
     	            image: moiveData.imageUrls.small,
		              fit: BoxFit.fill,
     	          ),
	            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(moiveData.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.star,color: Colors.yellow,size: 20,),
                      Icon(Icons.star,color: Colors.yellow,size: 20,),
                      Icon(Icons.star,color: Colors.yellow,size: 20,),
                      Icon(Icons.star,color: Colors.yellow,size: 20,),
                      Icon(Icons.star,color: Colors.yellow,size: 20,),
                      Text(moiveData.rating.average.toString()),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(moiveData.collectCount.toString()+'人收藏'),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}