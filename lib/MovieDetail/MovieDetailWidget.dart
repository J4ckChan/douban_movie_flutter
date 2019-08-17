import 'package:douban_movie_flutter/MovieDetail/CastsListView.dart';
import 'package:douban_movie_flutter/MovieDetail/CommentsListView.dart';
import 'package:douban_movie_flutter/MovieDetail/DouBanRatingCard.dart';
import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
import 'package:douban_movie_flutter/MovieDetail/MovieSummary.dart';
import 'package:douban_movie_flutter/MovieDetail/PosterAndTitle.dart';
import 'package:douban_movie_flutter/MovieDetail/TrailersListView.dart';
import 'package:flutter/material.dart';

class MovieDetailWidget extends StatelessWidget {

  const MovieDetailWidget({
    Key key,
    @required this.movieDetailData,
  }):super (key:key);

  final MovieDetailData movieDetailData;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PosterAndTitle(movieDetailData: movieDetailData),
          DouBanRatingCard(movieDetailData: movieDetailData),
          MovieSummary(summary: movieDetailData.summary,),
          CastListView(movieDetailData: movieDetailData,),
          TrailersListView(movieDetailData: movieDetailData),
          CommentsListView(movieDetailData: movieDetailData),
        ],
      ),
    );
  }
}
