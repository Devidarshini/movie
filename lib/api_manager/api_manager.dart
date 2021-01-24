import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmdbapp/model/top_rated.dart';
import 'package:tmdbapp/model/upcoming_movie.dart';

class ApiManager {
  var clint = http.Client();
  Future<Movie> getTopRatedMovies() async {
    var movie = null;

    var responce = await clint.get(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=6ffe94085cd3f924473b779510e6ec03');
    if (responce.statusCode == 200) {
      var jsonString = responce.body;
      var jsonMap = jsonDecode(jsonString);
      movie = Movie.fromMap(jsonMap);
    } else {
      print('Unsuccessful');
    }
    return movie;
  }
}
