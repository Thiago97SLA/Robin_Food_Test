import 'package:flutter/material.dart';

import 'package:preuba_hewlett_packard/src/Screens/Home.Dart';
import 'package:preuba_hewlett_packard/src/Screens/InitApp.Dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => Home(),
  };
}
