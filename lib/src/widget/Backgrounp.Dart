import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final String urlasset;
  Background(this.urlasset);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage(urlasset), fit: BoxFit.cover),
      ),
    );
  }
}
