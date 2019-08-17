import 'package:douban_movie_flutter/Component/HeaderWithArrow.dart';
import 'package:douban_movie_flutter/Component/StarsIcon/StarsIcon.dart';
import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
import 'package:flutter/material.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({
    Key key,
    @required this.movieDetailData,
  }) : super(key: key);

  final MovieDetailData movieDetailData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black38,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              HeaderWithArrow(title: '短评',titleSize: 22, subTitle: '全部 ${this.movieDetailData.commentsCount.toString()}',),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Container(
                  height: 1200,
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: this.movieDetailData.comments.length> 4? 4:this.movieDetailData.comments.length,
                    itemBuilder: (context,index){
                      Comment comment = this.movieDetailData.comments[index];
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(comment.author.avatar),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(comment.author.name,style:TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.w500)),
                                      StarsIcon(rating:comment.rating.value,size: 12,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(comment.content,style: TextStyle(color: Colors.white,fontSize: 18),),
                            Row(
                              children: <Widget>[
                                Icon(Icons.thumb_up,color: Colors.grey[50],),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Text(comment.usefulCount.toString(),style: TextStyle(color: Colors.grey[350],fontSize: 16),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context,index){
                      return Container(
                        constraints: BoxConstraints.tightFor(height: 1.0),
                        color: Colors.black26,
                      );
                    },
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints.tightFor(height:1.0),
                color: Colors.grey[350],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    print('go to comment page');
                  },
                  child: HeaderWithArrow(title: '查看全部短评',titleSize: 20,)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
