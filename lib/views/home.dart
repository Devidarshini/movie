import 'package:flutter/material.dart';
import 'package:tmdbapp/views/top_rated_view.dart';
import 'package:tmdbapp/views/upcoming_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int current = 0;

  int selectedScreen = 0;
  final tabs = [TopRatedView(), UpcomingMovie()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Magic'),
      ),
      body: tabs[selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedScreen,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text(
              'Top Rated',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            title: Text(
              'Up Comming',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        ],
        selectedItemColor: Theme.of(context).secondaryHeaderColor,
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedScreen = index;
          });
        },
      ),
    );
  }
}
