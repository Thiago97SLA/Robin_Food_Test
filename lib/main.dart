import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:preuba_hewlett_packard/src/routes/Router.Dart';
import 'package:preuba_hewlett_packard/src/Screens/InitApp.Dart';
import 'package:preuba_hewlett_packard/src/provider/DataApp.Dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataApp(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Library',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ScreenInit(),
        routes: getApplicationRoutes(),
      ),
    );
  }
}
