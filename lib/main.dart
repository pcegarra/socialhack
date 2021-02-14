import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialhack/app_state.dart';
import 'package:socialhack/pages/splash_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AppState(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Social Finder',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashPage());
  }
}
