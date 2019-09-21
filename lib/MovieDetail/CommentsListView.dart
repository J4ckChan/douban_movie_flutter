import 'package:douban_movie_flutter/Component/HeaderWithArrow.dart';
import 'package:douban_movie_flutter/Component/StarsIcon/StarsIcon.dart';
import 'package:douban_movie_flutter/MovieDetail/MovieDetailData.dart';
import 'package:flutter/material.dart';

class CommentsListView extends StatefulWidget {

  const CommentsListView(
    this.movieDetailData,{
    Key key,
  }) : super(key: key);

  final MovieDetailData movieDetailData;

  @override
  _CommentsListViewState createState() => _CommentsListViewState();
}

class _CommentsListViewState extends State<CommentsListView> {
  
  double commentHeight(String text) {
    TextPainter painter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: Colors.white,fontSize: 18),
        ),
      textDirection: TextDirection.ltr,
    )
    ..layout(maxWidth: MediaQuery.of(context).size.width - 80,minWidth: MediaQuery.of(context).size.width-80);
    print('height:'+painter.height.toString());
    return painter.height;
  }

  double get totalHeight {
    double height = 0.0;
    for (Comment comment in widget.movieDetailData.comments) {
      height += commentHeight(comment.content);
      height += 40+16+18+4+18;
    }
    print('totalHeight:'+ height.toString());
    return height;
  } 
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black38,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              HeaderWithArrow(title: '短评',titleSize: 22, subTitle: '全部 ${widget.movieDetailData.commentsCount.toString()}',),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Container(
                  height: totalHeight,
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.movieDetailData.comments.length> 4? 4:widget.movieDetailData.comments.length,
                    itemBuilder: (context,index){
                      Comment comment = widget.movieDetailData.comments[index];
                      return CommentWidget(comment: comment);
                    },
                    separatorBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          constraints: BoxConstraints.tightFor(height: 1.0),
                          color: Colors.grey[350],
                        ),
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

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key key,
    @required this.comment,
  }) : super(key: key);

  final Comment comment;
  //40+16+18+4+18
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 20.0,
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
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              children: <Widget>[
                Icon(Icons.thumb_up,color: Colors.grey[50],size: 18,),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text(comment.usefulCount.toString(),style: TextStyle(color: Colors.grey[350],fontSize: 16),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
