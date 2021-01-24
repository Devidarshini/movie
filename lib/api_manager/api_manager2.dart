import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmdbapp/model/top_rated.dart';
import 'package:tmdbapp/model/upcoming_movie.dart';
import 'package:tmdbapp/views/upcoming_view.dart' as upcoming;

class ApiManager2 {
  var clint = http.Client();
  Future<Upcoming> getUpcomingMovies() async {
    var upcoming = null;

    var responce = await clint.get(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=6ffe94085cd3f924473b779510e6ec03');
    if (responce.statusCode == 200) {
      var jsonString = responce.body;
      var jsonMap = jsonDecode(jsonString);
      upcoming = Upcoming.fromMap(jsonMap);
    } else {
      print('Unsuccessful');
    }
    return upcoming;
  }
}
