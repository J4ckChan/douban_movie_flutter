import 'package:flutter/material.dart';

class ButtonWithDouBanStyle1 extends StatelessWidget {
  
  final IconData icon;
  final String title;
  final String subTitle;
  final Color iconBackgroundColor;
  final VoidCallback onPressed; 

  const ButtonWithDouBanStyle1({
    Key key,
    @required this.onPressed,
    this.icon,
    this.title,
    this.subTitle,
    this.iconBackgroundColor = Colors.purple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        height: 92,
        decoration: BoxDecoration(
          border: BorderDirectional(bottom: BorderSide(width: 1,color: Colors.black12)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: <Widget>[
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconBackgroundColor,
                ),
                child: Icon(icon,size:30,color:Colors.white),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Text(subTitle,style: TextStyle(fontSize: 12),)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(Icons.arrow_right),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 30),
                child: Container(
                  decoration: BoxDecoration(
                    border: BorderDirectional(end: BorderSide(width: 1,color: Colors.black12)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}