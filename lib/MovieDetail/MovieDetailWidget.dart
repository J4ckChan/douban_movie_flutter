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

  bool reviewCardOn = true;
  final double endPositionY = kBottomNavigationBarHeight + 34.0;

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
  }

  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PosterAndTitle(widget.data),
              DouBanRatingCard( widget.data),
              MovieSummary(widget.data.summary,),
              CastListView(widget.data,),
              TrailersListView(widget.data),
              CommentsListView(widget.data),
            ],
          ),
          Positioned(
            top: animation.value,
            child:ReviewsCardListView(
              widget.data.popularReviews,
              onTap: (){
                reviewCardOn ? animationController.forward():animationController.reverse();
                reviewCardOn = !reviewCardOn;
              },
            ) ,
          ),
        ]
      ),
    );
  }

  @override
  void dispose() {
    this.animationController.dispose();
    super.dispose();
  }
}
