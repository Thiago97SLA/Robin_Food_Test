import 'package:flutter/material.dart';

class FontWidget extends StatelessWidget {
  final String text;
  final int color;
  final double size;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow overflow;

  FontWidget(
      {Key key,
      @required this.text,
      @required this.color,
      @required this.size,
      @required this.fontWeight,
      @required this.textAlign,
      this.overflow})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Montserrat',
        color: Color(color),
        fontSize: size,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
