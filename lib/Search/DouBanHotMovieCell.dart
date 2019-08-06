import 'package:douban_movie_flutter/Hot/MovieData.dart';
import 'package:flutter/material.dart';

class DouBanHotMovieCell extends StatefulWidget {

  const DouBanHotMovieCell({
    Key key,
    this.movieData,
  }):super(key:key);

  bool get hasMovieData  {
    if (movieData != null) {
      return true;
    } else {
      return false;
    }
  }
  final MovieData movieData;

  @override
  _DouBanHotMovieCellState createState() => _DouBanHotMovieCellState();
}

class _DouBanHotMovieCellState extends State<DouBanHotMovieCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        Navigator.pushNamed(context, '/movieDetail',arguments: widget.movieData.id);
      },  
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                width: (MediaQuery.of(context).size.width -32)/3.0 - 16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: hotMovieWeeklyImage(),
                ),
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width -32)/3.0 - 16,
              child: Text(widget.hasMovieData? widget.movieData.title:'',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),overflow: TextOverflow.ellipsis,)
            ),
            Container(
              color: Colors.white10,
              width: (MediaQuery.of(context).size.width -32)/3.0 - 16,
              child: Row(
                children: starIcons(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget hotMovieWeeklyImage() {
    if (!widget.hasMovieData) {
      return Image.asset('images/image_placeholder.png',fit: BoxFit.fill,);
    } else {
      return FadeInImage.assetNetwork(
        placeholder: 'images/image_placeholder.png',
        image: widget.movieData.imageUrls.small,
        fit: BoxFit.fill,
      );
    }
  }

  List<Widget> starIcons() {
    int startCount = 5;
    int yellowStarCount = 0;
    List<Widget> starIcons = new List();
    if (widget.hasMovieData) {
      yellowStarCount = (widget.movieData.rating.average.toInt()~/2).toInt();
    }
    do {
      startCount -= 1;
      if (yellowStarCount > 0) {
        starIcons.add(Icon(Icons.star,color:Colors.yellow,size:16));
        yellowStarCount-=1;
      } else {
        starIcons.add(Icon(Icons.star,color:Colors.black12,size:16));
      }
    } while (startCount > 0);

    return starIcons;
  }  

}