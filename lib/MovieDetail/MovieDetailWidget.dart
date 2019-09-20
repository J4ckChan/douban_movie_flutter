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
    this.data,{
    Key key,
  }):super (key:key);

  final MovieDetailData data;

  @override
  _MovieDetailWidgetState createState() => _MovieDetailWidgetState();
}

class _MovieDetailWidgetState extends State<MovieDetailWidget> {
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PosterAndTitle(widget.data),
          DouBanRatingCard( widget.data),
          MovieSummary(widget.data.summary,),
          CastListView(widget.data,),
          TrailersListView(widget.data),
          CommentsListView(widget.data),
          ReviewsCardListView(
            widget.data.popularReviews,
            onTap: (){

            },
          )
        ],
      ),
    );
  }
}
