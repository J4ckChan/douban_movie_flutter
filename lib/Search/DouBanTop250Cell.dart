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

  List<Widget>  get subTitleView{
    List<Widget> subWidget = List();
    double ratingDouble = moiveData.rating.average/2.0;
    int integer = (ratingDouble%10).toInt();
    double remainder = ratingDouble - integer;

    for (var i = 0; i < integer; i++){
      subWidget.add(Icon(Icons.star,color:Colors.yellow));
    }

    if (remainder < 0.5 && remainder > 0) {
      subWidget.add(Icon(Icons.star,color:Colors.black12));
    } else {
      subWidget.add(Icon(Icons.star_half,color:Colors.yellow));
    }

    subWidget.add(Text(moiveData.rating.average.toString()));
    subWidget.add(
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(moiveData.collectCount.toString()+'人收藏'),
      )
    );
    return subWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${this.index+1}'),
          Padding(
            padding: const EdgeInsets.only(left: 8,bottom: 4),
            child: Container(
              width: 45,
	            height: 60,
	            child: ClipRRect(
		            borderRadius: BorderRadius.circular(4),
		            child: FadeInImage.assetNetwork(
		              placeholder: 'images/image_placeholder.png',
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
                    children: subTitleView,
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