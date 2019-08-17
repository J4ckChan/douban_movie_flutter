import 'package:flutter/material.dart';

class HeaderWithArrow extends StatelessWidget {

  const HeaderWithArrow({
    Key key,
    @required this.title,
    this.titleSize,
    this.subTitle,
  }):super(key:key);

  final String title;
  final String subTitle;
  final double titleSize;

  List<Widget> get subTitleAndArrow {
    if (subTitle != null && subTitle.isNotEmpty) {
      return [
        Text(subTitle,style: TextStyle(fontSize: 16,color: Colors.grey[350]),),
        Icon(Icons.arrow_forward_ios,color: Colors.grey[350],size: 16,),
        ];
    } else {
      return [Icon(Icons.arrow_forward_ios,color: Colors.grey[350],size: 16),];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title,style: TextStyle(fontSize: titleSize == null?24:titleSize,color: Colors.white,fontWeight: FontWeight.bold),),
        Row(
          children: subTitleAndArrow,
        )
      ],
    );
  }

  
}