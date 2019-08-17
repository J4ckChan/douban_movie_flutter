import 'package:flutter/material.dart';

class MovieSummary extends StatefulWidget {
  const MovieSummary({
    Key key,
    @required this.summary,
  }) : super(key: key);

  final String summary;
  @override
  _MovieSummaryState createState() => _MovieSummaryState();
}

class _MovieSummaryState extends State<MovieSummary> {

  int _maxLineOfSummary = 4;
  TextStyle style = TextStyle(fontSize: 18,color: Colors.white);

  bool get isExceedMaxLines {
    TextPainter _textPainter = TextPainter(
      maxLines: _maxLineOfSummary,
      text: TextSpan(
        text: widget.summary,
        style: this.style,
      ),
      textDirection: TextDirection.ltr,
    )
    ..layout(maxWidth: MediaQuery.of(context).size.width - 32,minWidth: MediaQuery.of(context).size.width - 32);
    if (_textPainter.didExceedMaxLines) {
      return true;
    } else {
      return false;
    }
  }

  List<Widget> get sumaryList {
    List<Widget> list = List();
    list.add(Text(widget.summary,style:style,maxLines: _maxLineOfSummary,overflow: TextOverflow.ellipsis,));
    
    if (this.isExceedMaxLines) {
      list.add(GestureDetector(
        onTap: (){
          setState(() {
            this._maxLineOfSummary = 20;
          });
        },
        child: Text('展开',style:TextStyle(fontSize: 18,color: Colors.grey[350],decoration: TextDecoration.underline),)));
    }
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16,top: 16),
          child: Text('剧情简介',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: sumaryList
            )
          ),
      ],
    );
  }
}