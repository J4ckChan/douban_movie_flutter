import 'package:flutter/material.dart';

class StarsIcon extends StatelessWidget {

  const StarsIcon ({
    Key key,
    @required this.rating,
    this.size,
    this.color,
  }):super (key:key);

  final double rating;
  final double size;
  final Color color;

  int get integer {
    return this.rating != null ? (rating%10).toInt() : 0;
  }
  double get remainder {
    return this.rating != null ? (rating - integer) : 0.0;
  } 

  List<Widget>  get starIcons{
    List<Widget> subWidget = List();

    for (var i = 0; i < integer; i++){
      subWidget.add(Icon(Icons.star,color:this.color != null? this.color:Colors.yellow[700],size: this.size,));
    }

    if (remainder < 0.5 && remainder > 0) {
      subWidget.add(Icon(Icons.star,color:this.color != null? this.color:Colors.black12,size: this.size,));
    } else if (remainder > 0.5){
      subWidget.add(Icon(Icons.star_half,color:this.color != null? this.color:Colors.yellow[700],size: this.size,));
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