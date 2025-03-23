import 'package:movies/api/model/search_movies_response/SearchMovies.dart';

class SearchMoviesResponse {
  int? page;
  List<SearchMovies>? results;
  int? totalPages;
  int? totalResults;

  SearchMoviesResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  SearchMoviesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <SearchMovies>[];
      json['results'].forEach((v) {
        results!.add(new SearchMovies.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}
