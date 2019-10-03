import 'package:douban_movie_flutter/Component/StarsIcon/StarsIcon.dart';
import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
import 'package:flutter/material.dart';

class ReviewsCardListView extends StatelessWidget {
  
ReviewsCardListView(
    this.popularReviews,{
      Key key,
      this.onTap,
      this.onVerticalDragUpdate,
      this.scrollBool = true,
    }) : super(key: key);

  final List<Review> popularReviews;
  final VoidCallback onTap;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final double reviewHeight = 180.0;
  bool scrollBool;

  @override
  Widget build(BuildContext context) {

    double listViewHeight = this.scrollBool? MediaQuery.of(context).size.height - kBottomNavigationBarHeight - 140: popularReviews.length * (reviewHeight + 10.0);

    return GestureDetector(
      onTap: this.onTap,
      onVerticalDragUpdate: this.onVerticalDragUpdate,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xF7F5F5FF),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:4.0),
              child: Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.grey[350],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('影评列表',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
            ),
            Container(
              height: listViewHeight,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                physics: this.scrollBool? AlwaysScrollableScrollPhysics():NeverScrollableScrollPhysics(),
                itemCount: popularReviews.length,
                itemBuilder: (context,index){
                  Review review = popularReviews[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: reviewHeight,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 16,top: 8),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 12.0,
                                  backgroundImage: NetworkImage(review.author.avatar),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8,right: 8),
                                  child: Text(review.author.name + "  看过"),
                                ),
                                StarsIcon(rating: review.rating.value,size: 14,)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8,left: 16,right: 16),
                            child: Text(
                              review.title,
                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8,left: 16,right: 16),
                            child: Text(
                              review.summary,
                              style: TextStyle(fontSize: 16),
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
            Padding(padding: const EdgeInsets.only(top: 44),)
          ],
        ),
      ),
    );
  }
}