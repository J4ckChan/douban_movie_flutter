import 'package:douban_movie_flutter/MovieDetail/CastsListView.dart';
import 'package:douban_movie_flutter/MovieDetail/CommentsListView.dart';
import 'package:douban_movie_flutter/MovieDetail/DouBanRatingCard.dart';
import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
import 'package:douban_movie_flutter/MovieDetail/MovieSummary.dart';
import 'package:douban_movie_flutter/MovieDetail/PosterAndTitle.dart';
import 'package:douban_movie_flutter/MovieDetail/ReviewsCardListView.dart';
import 'package:douban_movie_flutter/MovieDetail/TrailersListView.dart';
import 'package:flutter/material.dart';

class MovieDetailWidget extends StatefulWidget {

  const MovieDetailWidget(
    this.data,
    this.size,{
    Key key,
  }):super (key:key);

  final MovieDetailData data;
  final Size size;

  @override
  _MovieDetailWidgetState createState() => _MovieDetailWidgetState();
}

class _MovieDetailWidgetState extends State<MovieDetailWidget> {

  ScrollController scrollController = ScrollController();

  bool reviewCardUp = false;
  bool reviewCardOn = true;
  final double endPositionY = kBottomNavigationBarHeight + 34.0;

  double reviewsCardInPositionX = 1800;
  var columnKey = GlobalKey();
  double columnHeight = -1.0;
  double reviewsCardPostitonY = 0.0;

  @override
  void initState() {
    super.initState();
    reviewsCardPostitonY = 0.9 * widget.size.height - endPositionY;

    scrollController.addListener((){
      if (columnHeight < 0) {
        columnHeight = columnKey.currentContext.findRenderObject().paintBounds.height;
        reviewsCardInPositionX = columnHeight - (0.9*widget.size.height - endPositionY);
      }
      // print("______ columnHeight:$reviewsCardInPositionX");
      // print(scrollController.offset);
      bool isOn = scrollController.offset > reviewsCardInPositionX && reviewCardOn;
      bool isIn = scrollController.offset < reviewsCardInPositionX && !reviewCardOn;
      if (isOn || isIn) {
        // print("isOn || isIn $reviewsCardInPositionX");
        setState(() => reviewCardOn = !reviewCardOn);
      }
    });
  }

  
  @override
  Widget build(BuildContext context) {

    GestureDragUpdateCallback onVerticalDragUpdate = (DragUpdateDetails details) {
      print('${details.delta},${details.globalPosition},${details.localPosition}');
      setState(() {
        double temp = reviewsCardPostitonY + details.delta.dy;
        if (temp > 2 && temp < 0.9 * widget.size.height - endPositionY) {
          reviewsCardPostitonY = temp;
        }
      });
    };

    var reviewsCard = ReviewsCardListView(widget.data.popularReviews,scrollBool: reviewCardUp,onVerticalDragUpdate: onVerticalDragUpdate,);

    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          controller: scrollController,
          child: Column(
            key: columnKey,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PosterAndTitle(widget.data),
              DouBanRatingCard( widget.data),
              MovieSummary(widget.data.summary,),
              CastListView(widget.data,),
              TrailersListView(widget.data),
              CommentsListView(widget.data),
              reviewCardOn ? Container() : reviewsCard, 
            ],
          ),
        ),
        reviewCardOn? Positioned(top: reviewsCardPostitonY,child:reviewsCard): Container(),
      ]
    );
  }

  @override
  void dispose() {
    this.scrollController.dispose();
    super.dispose();
  }
}
