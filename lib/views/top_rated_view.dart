import 'package:flutter/material.dart';
import 'package:tmdbapp/api_manager/api_manager.dart';
import 'package:tmdbapp/model/top_rated.dart';

class TopRatedView extends StatefulWidget {
  @override
  _TopRatedViewState createState() => _TopRatedViewState();
}

class _TopRatedViewState extends State<TopRatedView> {
  Future<Movie> _movie;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _movie = ApiManager().getTopRatedMovies();
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
                height: MediaQuery.of(context).size.height - 50.0,
                width: 340.0,
                child: FutureBuilder<Movie>(
                  future: _movie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.results.length,
                          itemBuilder: (BuildContext context, int index) {
                            var topmovie = snapshot.data.results[index];
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
                                      topmovie.title,
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
                                            topmovie.originalLanguage == 'en'
                                                ? 'English'
                                                : topmovie.originalLanguage ==
                                                        'hi'
                                                    ? 'Hindi'
                                                    : topmovie.originalLanguage ==
                                                            'ja'
                                                        ? 'Japanese'
                                                        : topmovie.originalLanguage ==
                                                                'fr'
                                                            ? 'French'
                                                            : topmovie.originalLanguage ==
                                                                    'it'
                                                                ? 'Italian'
                                                                : 'Korien',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor),
                                          ),
                                        ),
                                        // SizedBox(width: 60.0),
                                        // Text('Rating: '),
                                        Text(topmovie.voteAverage.toString(),
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .secondaryHeaderColor)),
                                        Icon(
                                          Icons.star,
                                          size: 12.0,
                                          color: Colors.yellow[700],
                                        )
                                      ],
                                    ),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(topmovie.overview),
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
