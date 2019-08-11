import 'package:flutter/material.dart';

class ColumnStack extends StatelessWidget {
  const ColumnStack({
    Key key,
    @required this.ratio,
  }) : super(key: key);

  final double ratio;
  final double height = 7;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Stack(
        children: <Widget>[
          Container(
            width: 120,
            height: this.height,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(2)
            ),
          ),
          Container(
            width: 120 * this.ratio,
            height: this.height,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(2),
            ),
          )
        ]
      ),
    );
  }
}

