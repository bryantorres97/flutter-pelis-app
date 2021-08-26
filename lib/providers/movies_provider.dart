import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/models/popular_movies_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '5d9c339dea8b379b0a491de8896d5ed1';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    print('Inicializado Movies Provider');
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    try {
      final data = await _getJsonData('3/movie/now_playing');
      final nowPlayingResponse = NowPlayingResponse.fromJson(data);
      onDisplayMovies = nowPlayingResponse.results;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  getPopularMovies() async {
    try {
      _popularPage++;
      final data = await _getJsonData('3/movie/popular', _popularPage);
      final popularMoviesResponse = PopularMoviesResponse.fromJson(data);
      popularMovies = [...popularMovies, ...popularMoviesResponse.results];
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    print('Pidiendo informacion al servidor');
    final data = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(data);
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}
