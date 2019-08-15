import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
import 'package:flutter/material.dart';


class CastListView extends StatelessWidget {

  const CastListView({
    Key key,
    @required this.movieDetailData,
  }):super(key:key);

  final MovieDetailData movieDetailData;
  List<Person> get persons {
    List<Person> list = List();
    list.add(this.movieDetailData.directors[0]);
    list.addAll(this.movieDetailData.casts);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('演职表',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
              Icon(Icons.arrow_forward_ios,color: Colors.white,)
            ],
          ),
          Container(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: this.persons.length,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: FadeInImage.assetNetwork(
                          width: 80,
                          height: 120,
                          placeholder: 'images/image_placeholder.png',
                          image: this.persons[index].avatars.small,
                        ),
                      ),
                      Text('${this.persons[index].name}',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}