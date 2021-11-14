import 'package:flutter/material.dart';

Widget loadinginfo() {
  return Container(
    alignment: Alignment.bottomCenter,
    child: Column(
      children: [
        CircularProgressIndicator(
          backgroundColor: Color(0xFFD5EAFF),
          valueColor: AlwaysStoppedAnimation(
            Color(0xFF1C1066),
          ),
        ),
      ],
    ),
  );
}
