import 'package:flutter/material.dart';
import 'package:movies/api/model/popular_response/Movies.dart';
import 'package:movies/ui/widget/top_side_movies_style/Top_Side_Movies_Style.dart';

class TopSideSection extends StatelessWidget {
  Movies movies;

  TopSideSection({required this.movies});

  @override
  Widget build(BuildContext context) {
    return TopSideMoviesStyle(movies: movies, index: 1);
  }
}
