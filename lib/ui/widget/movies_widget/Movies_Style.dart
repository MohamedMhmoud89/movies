import 'package:flutter/material.dart';
import 'package:movies/api/model/Movies.dart';
import 'package:movies/ui/screen/movies_detials_screen/Movies_Details_Screen.dart';

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
          width: 96.87360382080078,
          height: 127.73600006103516,
          fit: BoxFit.fill,
          movies[index].posterPath == null
              ? "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"
              : "https://image.tmdb.org/t/p/w500/${movies[index].posterPath}",
        ),
      ),
    );
  }
}
