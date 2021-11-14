import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:preuba_hewlett_packard/src/widget/Backgrounp.Dart';

class ScreenInit extends StatefulWidget {
  const ScreenInit({Key key}) : super(key: key);

  @override
  _ScreenInitState createState() => _ScreenInitState();
}

class _ScreenInitState extends State<ScreenInit> {
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, 'home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background('assets/background/init.png'),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 4,
            left: MediaQuery.of(context).size.width / 2 - 25,
            child: Container(
              child: SpinKitFadingCircle(
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
