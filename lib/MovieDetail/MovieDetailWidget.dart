import 'package:douban_movie_flutter/Component/ColumnStack/ColumnStack.dart';
import 'package:douban_movie_flutter/Component/StarsIcon/StarsIcon.dart';
import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
import 'package:douban_movie_flutter/MovieDetail/PosterAndTitle.dart';
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
      child: PosterAndTitle(movieDetailData: movieDetailData),
    );
  }
}

