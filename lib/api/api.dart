import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:showtime/models/movie.dart';
import 'package:showtime/models/series.dart';
import 'package:showtime/utils/constants.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';

  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

  static const _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  static const _trendingSeriesUrl =
      'https://api.themoviedb.org/3/trending/tv/day?api_key=${Constants.apiKey}';

  static const _topRatedSeriesUrl =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.apiKey}';

  static const _upcomingSeriesUrl =
      'https://api.themoviedb.org/3/tv/on_the_air?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Series>> getTrendingSeries() async {
    final response = await http.get(Uri.parse(_trendingSeriesUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((series) => Series.fromJson(series)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Series>> getTopRatedSeries() async {
    final response = await http.get(Uri.parse(_topRatedSeriesUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((series) => Series.fromJson(series)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Series>> getUpcomingSeries() async {
    final response = await http.get(Uri.parse(_upcomingSeriesUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((series) => Series.fromJson(series)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
}
