import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/api/model/more_like_this_section/MoreLikeThisSectionResponse.dart';
import 'package:movies/api/model/movies_details_response/movies_details_response.dart';
import 'package:movies/api/model/popular_response/Movies_Response.dart';
import 'package:movies/api/model/search_movies_response/SearchMoviesResponse.dart';

class ApiManager {
  static const String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMjhiMDllMzVmMzNjYzZhNTY5NTI3MjJkMTdlNjhmOSIsIm5iZiI6MTcwOTY0NTYyMy41MTEwMDAyLCJzdWIiOiI2NWU3MWYzNzU2ODQ2MzAxNDlhOGQxZGQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.6KJWF5uu9N3c0QrKZT7W35xvO29Qjsq041sAWWwKk_k';
  static const String baseUrl = 'api.themoviedb.org';

  static Future<Movies_Response> getMovies(String state) async {
    var url = Uri.https(baseUrl, '3/movie/$state');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var jsonString = response.body;
    var json = jsonDecode(jsonString);
    var moviesResponse = Movies_Response.fromJson(json);
    return moviesResponse;
  }

  static Future<MoviesDetailsResponse> getMoviesDetails(int movieId) async {
    var url = Uri.https(baseUrl, '3/movie/$movieId');
    print(movieId);
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var jsonString = response.body;
    var json = jsonDecode(jsonString);
    var moviesDetailsResponse = MoviesDetailsResponse.fromJson(json);
    return moviesDetailsResponse;
  }

  static Future<MoreLikeThisSectionResponse> getLikeMoreMovies(
      int movieId) async {
    var url = Uri.https(baseUrl, '3/movie/$movieId/similar');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var jsonString = response.body;
    var json = jsonDecode(jsonString);
    var moreLikeThisSectionResponse = MoreLikeThisSectionResponse.fromJson(
        json);
    return moreLikeThisSectionResponse;
  }

  static Future<SearchMoviesResponse> searchMovies(String query) async {
    var url = Uri.https(baseUrl, '3/movie/search/movie', {
      'query': "l"
    });
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var jsonString = response.body;
    var json = jsonDecode(jsonString);
    var searchMoviesResponse = SearchMoviesResponse.fromJson(json);
    return searchMoviesResponse;
  }
}
