import 'package:douban_movie_flutter/Component/FiveStarIcon/FiveStarIcon.dart';
import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 120,
              height: 160,
	            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FadeInImage.assetNetwork(
                  placeholder: 'images/image_placeholder.png',
                  image: this.movieDetailData.imageURLs.smallURL,
                  fit: BoxFit.fill,
                ),
	            ),
	          ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.movieDetailData.title,
                      style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text('(${this.movieDetailData.year})',style: TextStyle(color: Colors.white,fontSize: 20),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 120 - 48,
                        child: Text(this.movieDetailData.countries.join()+' / '+ 
                          this.movieDetailData.genres.join(" ")+' / '+
                          this.movieDetailData.mainlandPubdate+' 上映 / '+ 
                          this.movieDetailData.durations.join(),
                          style: TextStyle(color: Colors.grey[350],fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Container(
                        height: 40,
                        width: 240,
                        decoration: BoxDecoration(
                          color: Colors.red[400],
                          borderRadius:BorderRadius.circular(8) 
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right:8),
                                child: Text('已看过',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
                              ),
                              FiveStarIcon(rating: this.movieDetailData.rating.average/2.0,size: 15.0,),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text('20190716',style:TextStyle(color: Colors.grey[300])),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}