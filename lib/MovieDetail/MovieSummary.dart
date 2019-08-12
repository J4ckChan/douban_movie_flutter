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

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget>[
        Padding(
      padding: const EdgeInsets.only(left: 16,top: 8),
      child: Text('剧情简介',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
    ),
        Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  widget.summary,
                  style:TextStyle(fontSize: 18,color: Colors.white),
                  maxLines: _maxLineOfSummary,
                  overflow: TextOverflow.ellipsis,
                ),
                GestureDetector(
                  onTap: (){
                    _maxLineOfSummary = 0;
                    setState(() {
                      _maxLineOfSummary = 8;
                    });
                  },
                  child: Text('展开',style:TextStyle(fontSize: 18,color: Colors.white,decoration: TextDecoration.underline),)
                ),
              ],
            )
          ),
      ],
    );
  }
}