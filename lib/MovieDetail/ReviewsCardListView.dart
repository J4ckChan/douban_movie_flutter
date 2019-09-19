import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
import 'package:flutter/material.dart';

class ReviewsCardListView extends StatelessWidget {
  const ReviewsCardListView({
    Key key,
    @required this.popularReviews,
  }) : super(key: key);

  final List<Review> popularReviews;
  final double reviewHeight = 160.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xF7F5F5FF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('影评列表',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ),
          Container(
            height: popularReviews.length * (reviewHeight + 10),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: popularReviews.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    color: Colors.white,
                    height: reviewHeight,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 16,right: 16),
                          child: Text(
                            popularReviews[index].title,
                            style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 16,right: 16),
                          child: Text(
                            popularReviews[index].summary,
                            style: TextStyle(fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}