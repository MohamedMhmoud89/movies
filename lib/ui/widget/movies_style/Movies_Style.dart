import 'package:flutter/material.dart';
import 'package:movies/api/model/popular_response/Movies.dart';
import 'package:movies/ui/movies_detials_screen/Movies_Details_Screen.dart';

class MoviesStyle extends StatelessWidget {
  List<Movies> movies;
  int index;

  MoviesStyle({required this.movies, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return MoviesDetailsScreen(
                movieId: movies[index].id,
                title: movies[index].title,
              );
            },));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          "https://image.tmdb.org/t/p/w500${movies[index].posterPath}" ?? "",
        ),
      ),
    );
  }
}
