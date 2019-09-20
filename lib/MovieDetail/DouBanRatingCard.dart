import 'package:douban_movie_flutter/Component/ColumnStack/ColumnStack.dart';
import 'package:douban_movie_flutter/Component/HeaderWithArrow.dart';
import 'package:douban_movie_flutter/Component/StarsIcon/StarsIcon.dart';
import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
import 'package:flutter/material.dart';

class DouBanRatingCard extends StatelessWidget {
  const DouBanRatingCard(
    this.movieDetailData,{
    Key key,
  }) : super(key: key);

  final MovieDetailData movieDetailData;
  List<Widget> get starsColumn{
    List<Widget> list = List();
    var count = 5.0;
    while (count > 0) {
      var starRow = StarsIcon(rating:count,color:Colors.grey[200],size: 10,);
      list.add(starRow);
      count--;
    }
    list.add(Padding(padding: const EdgeInsets.only(top: 12),));
    return list;
  }
  List<Widget> get columnStacks{
    Map details = this.movieDetailData.rating.details;
    double totalCount = 1.0;
    List<int> keys = [5,4,3,2,1];

    for (int key in keys) {
      totalCount = totalCount + details[key.toString()];
    }

    List<Widget> list = List();
    for (int key in keys) {
      double count = details[key.toString()];
      double ratio = count/totalCount;
      list.add(ColumnStack(ratio: ratio,));
    }

    list.add(
      Text(this.movieDetailData.ratingsCount.toString()+'评分',
          style: TextStyle(color: Colors.black38,fontSize: 12),
          )
        );

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8,left:16,right: 16),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 24,right: 16,top: 8),
              child: HeaderWithArrow(title: '豆瓣评分',titleSize: 14,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 8,top: 8),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        this.movieDetailData.rating.average.toString(),
                        style: TextStyle(fontSize: 48,color: Colors.white),
                      ),
                      StarsIcon(rating: this.movieDetailData.rating.average/2,size: 16,)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: starsColumn,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: columnStacks
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('好友评价',style: TextStyle(color: Colors.grey[350]),),
                        Text('8.7分',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                        Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: <Widget>[
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 28),
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:12),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16,top: 4,right: 16,bottom: 4),
              child: Container(
                height: 1,
                color: Colors.black12,
              ),
            ),
            Text('64.9万看过  '+ (this.movieDetailData.wishCount~/10000).toInt().toString() + '万人想看   ',style:TextStyle(color: Colors.grey[350]))
          ],
        ),
      ),
    );
  }
}

