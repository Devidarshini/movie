import 'package:flutter/material.dart';
import 'package:tmdbapp/api_manager/api_manager.dart';
import 'package:tmdbapp/api_manager/api_manager2.dart';
import 'package:tmdbapp/model/top_rated.dart';
import 'package:tmdbapp/model/upcoming_movie.dart';

class UpcomingMovie extends StatefulWidget {
  @override
  _UpcomingMovieState createState() => _UpcomingMovieState();
}

class _UpcomingMovieState extends State<UpcomingMovie> {
  Future<Upcoming> _upcoming;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _upcoming = ApiManager2().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: 340.0,
                child: FutureBuilder<Upcoming>(
                  future: _upcoming,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.results.length,
                          itemBuilder: (BuildContext context, int index) {
                            var upcomingmovie = snapshot.data.results[index];
                            return Card(
                                child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ExpansionTile(
                                    leading: Icon(
                                      Icons.movie,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    title: Text(
                                      upcomingmovie.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                    subtitle: Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                              upcomingmovie.originalLanguage ==
                                                      'en'
                                                  ? 'English'
                                                  : upcomingmovie
                                                              .originalLanguage ==
                                                          'hi'
                                                      ? 'Hindi'
                                                      : upcomingmovie
                                                                  .originalLanguage ==
                                                              'ja'
                                                          ? 'Japanese'
                                                          : upcomingmovie
                                                                      .originalLanguage ==
                                                                  'fr'
                                                              ? 'French'
                                                              : upcomingmovie
                                                                          .originalLanguage ==
                                                                      'it'
                                                                  ? 'Italian'
                                                                  : 'Korien',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .secondaryHeaderColor)),
                                        ),
                                        // SizedBox(width: 60.0),
                                        // Text('Rating: '),
                                        Text(
                                            upcomingmovie.voteAverage
                                                .toString(),
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor)),
                                        Icon(Icons.star,
                                            size: 12.0,
                                            color: Colors.yellow[700]),
                                      ],
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(upcomingmovie.overview),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
