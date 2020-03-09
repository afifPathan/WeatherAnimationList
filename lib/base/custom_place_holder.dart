import 'package:flutter/material.dart';

class CustomPlaceHolder extends StatelessWidget {
  final String message;
  final double fontSize;

  CustomPlaceHolder({
    @required this.message,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          (message != null && message.isNotEmpty)
              ? message
              : 'Something went wrong',
          style: TextStyle(
            color: Colors.grey,
            fontSize: fontSize ?? 16.0,
          ),
        ),
      ),
    );
  }
}
