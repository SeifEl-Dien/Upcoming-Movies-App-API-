import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'movie.dart';

class HttpHelper {
  final String urlKey = 'api_key=745c01d332b0ecea38d2c16e61cc5aa8';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';
  final String urlsearchbase =
      'https://api.themoviedb.org/3/search/movie?api_key=745c01d332b0ecea38d2c16e61cc5aa8&query=';

  Future<List?> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    http.Response result = await http.get(Uri.parse(upcoming));
    if (result.statusCode == HttpStatus.ok) {
      final JsonResponse = json.decode(result.body);
      final moviesmap = JsonResponse['results'];
      List movies = moviesmap.map((i) => Movie.fromjson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<List?> findMovies(String title) async {
    final String query = urlsearchbase + title;
    http.Response result = await http.get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok) {
      final JsonResponse = json.decode(result.body);
      final moviesmap = JsonResponse['results'];
      List movies = moviesmap.map((i) => Movie.fromjson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
