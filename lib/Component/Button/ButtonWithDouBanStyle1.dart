import 'package:flutter/material.dart';

class ButtonWithDouBanStyle1 extends StatelessWidget {

  IconData icon;
  String title;
  String subTitle;
  Color iconBackgroundColor;

  ButtonWithDouBanStyle1(this.icon,this.title,this.subTitle,{this.iconBackgroundColor = Colors.purple});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blueGrey,
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
            )
          ],
        ),
      ),
    );
  }
}