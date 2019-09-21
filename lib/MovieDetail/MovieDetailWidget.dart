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

class _MovieDetailWidgetState extends State<MovieDetailWidget> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController animationController;
  ScrollController scrollController = ScrollController();

  bool reviewCardUp = false;
  bool reviewCardOn = true;
  final double endPositionY = kBottomNavigationBarHeight + 34.0;

  double reviewsCardInPositionX = 1800;
  var columnKey = GlobalKey();
  double columnHeight = -1.0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this);
    animation = Tween(begin: 0.9 * widget.size.height - endPositionY, end:2.0).animate(animationController)
      ..addListener((){
        setState(() {
          
        });
      });

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

    VoidCallback onTap = (){ 
      if (reviewCardOn) {
        reviewCardUp ? animationController.reverse():animationController.forward();
        reviewCardUp = !reviewCardUp;
      }};

    var reviewsCard = ReviewsCardListView(widget.data.popularReviews, onTap: onTap);

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
        reviewCardOn? Positioned(top: animation.value,child:reviewsCard): Container(),
      ]
    );
  }

  @override
  void dispose() {
    this.animationController.dispose();
    this.scrollController.dispose();
    super.dispose();
  }
}
