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
    this.size, {
    Key key,
  }) : super(key: key);

  final MovieDetailData data;
  final Size size;

  @override
  _MovieDetailWidgetState createState() => _MovieDetailWidgetState();
}

class _MovieDetailWidgetState extends State<MovieDetailWidget>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  Animation _animation;
  AnimationController _animationController;

  bool reviewCardUp = false;
  bool reviewCardOn = true;
  final double endPositionY = kBottomNavigationBarHeight + 34.0;

  double reviewsCardInPositionX = 1800;
  var columnKey = GlobalKey();
  double columnHeight = -1.0;
  double reviewsCardPostitonY = 0.0;
  double startPositionY = 0.0;

  @override
  void initState() {
    super.initState();
    startPositionY = 0.9 * widget.size.height - endPositionY;
    reviewsCardPostitonY = startPositionY;

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    scrollController.addListener(() {
      if (columnHeight < 0) {
        columnHeight =
            columnKey.currentContext.findRenderObject().paintBounds.height;
        reviewsCardInPositionX = columnHeight - startPositionY;
      }
      bool isOn =
          scrollController.offset > reviewsCardInPositionX && reviewCardOn;
      bool isIn =
          scrollController.offset < reviewsCardInPositionX && !reviewCardOn;
      if (isOn || isIn) {
        setState(() => reviewCardOn = !reviewCardOn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    GestureDragUpdateCallback onVerticalDragUpdate =
        (DragUpdateDetails details) {
      setState(() {
        double temp = reviewsCardPostitonY + details.delta.dy;
        if (temp > 2 && temp < startPositionY) {
          reviewsCardPostitonY = temp;
        }
      });
    };

    GestureDragEndCallback onVerticalDragEnd = (DragEndDetails details) {
      double value = (startPositionY + 2.0) / 2.0;
      double endValue = 2.0;
      if (reviewsCardPostitonY > value) {
        endValue = startPositionY;
      }
      _animation = Tween(begin: reviewsCardPostitonY, end: endValue).animate(_animationController);
      setState(() {
        reviewsCardPostitonY = _animation.value;
        _animationController.forward();
      });
    };

    var reviewsCard = ReviewsCardListView(
      widget.data.popularReviews,
      scrollBool: reviewsCardPostitonY < 2.1,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
    );

    return Stack(children: <Widget>[
      SingleChildScrollView(
        controller: scrollController,
        child: Column(
          key: columnKey,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PosterAndTitle(widget.data),
            DouBanRatingCard(widget.data),
            MovieSummary(
              widget.data.summary,
            ),
            CastListView(
              widget.data,
            ),
            widget.data.trailers.isNotEmpty
              ? TrailersListView(widget.data.trailers)
              : Container(),
            CommentsListView(widget.data),
            reviewCardOn ? Container() : reviewsCard,
          ],
        ),
      ),
      reviewCardOn
          ? Positioned(top: reviewsCardPostitonY, child: reviewsCard)
          : Container(),
    ]);
  }

  @override
  void dispose() {
    _animationController.dispose();
    this.scrollController.dispose();
    super.dispose();
  }
}
