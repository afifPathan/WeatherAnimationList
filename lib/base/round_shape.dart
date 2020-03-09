import 'package:flutter/material.dart';
import 'package:weatheranimationapp/colors.dart';

class RoundShape extends StatelessWidget {
  final Color color;
  final String text;
  final int temp;

  RoundShape({
    @required this.color,
    @required this.text,
    @required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            maxLines: 1,
            style: TextStyle(color: kTextWhite, fontSize: 18.0),
          ),
          Container(
            height: 100,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.white, blurRadius: 0.0, spreadRadius: 1.0)
              ],
            ),
            child: ClipOval(
              child: Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    tileMode: TileMode.clamp,
                    colors: [
                      Colors.grey.withOpacity(0.3),
                      color.withOpacity(0.6),
                      color.withOpacity(0.9),
                    ]),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        new TextSpan(
                          text: " $temp",
                          style: TextStyle(color: kTextWhite, fontSize: 24.0),
                        ),
                        new TextSpan(
                          text: '°',
                          style: TextStyle(color: kTextWhite, fontSize: 24.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
