// To parse this JSON data, do
//
//     final popularMoviesResponse = popularMoviesResponseFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas_app/models/models.dart';

class PopularMoviesResponse {
  PopularMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory PopularMoviesResponse.fromJson(String str) =>
      PopularMoviesResponse.fromMap(json.decode(str));

  factory PopularMoviesResponse.fromMap(Map<String, dynamic> json) =>
      PopularMoviesResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
