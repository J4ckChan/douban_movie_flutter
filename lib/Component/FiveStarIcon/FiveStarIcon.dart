import 'package:flutter/material.dart';

class FiveStarIcon extends StatelessWidget {

  const FiveStarIcon ({
    Key key,
    @required this.rating,
    this.size,
  }):super (key:key);

  final double rating;
  final double size;

  int get integer {
    return this.rating != null ? (rating%10).toInt() : 0;
  }
  double get remainder {
    return this.rating != null ? (rating - integer) : 0.0;
  } 

  List<Widget>  get starIcons{
    List<Widget> subWidget = List();

    for (var i = 0; i < integer; i++){
      subWidget.add(Icon(Icons.star,color:Colors.yellow[700],size: this.size,));
    }

    if (remainder < 0.5 && remainder > 0) {
      subWidget.add(Icon(Icons.star,color:Colors.black12,size: this.size,));
    } else {
      subWidget.add(Icon(Icons.star_half,color:Colors.yellow[700],size: this.size,));
    }
    
    return subWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: starIcons
    );
  }
}