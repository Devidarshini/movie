import 'package:flutter/material.dart';
import 'package:tmdbapp/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo[700],
        secondaryHeaderColor: Colors.black,
        // iconTheme: IconThemeData(color: Colors.yellow[700],size:12.0)
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => Home(),
      },
    );
  }
}
