import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mo_se_diary_app/Model/model.dart';

const apiKey = "0b168b40d626ffdbd23540f26ceb63b0";

class APIservices {
  final nowShowingApi =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey";
  final upComingApi =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";
  final popularApi =
      "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
  // for nowShowing moveis
  Future<List<Movie>> getNowShowing() async {
    Uri url = Uri.parse(nowShowingApi);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }

  // for up coming moveis
  Future<List<Movie>> getUpComing() async {
    Uri url = Uri.parse(upComingApi);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }

  // for popular moves
  Future<List<Movie>> getPopular() async {
    Uri url = Uri.parse(popularApi);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
