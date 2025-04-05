import 'package:flutter/material.dart';
import 'package:movies/api/model/Movies.dart';
import 'package:movies/db/Movies_Cloud_Store_Dao.dart';
import 'package:movies/db/model/Movies_Cloud_Store.dart';
import 'package:movies/ui/screen/movies_detials_screen/Movies_Details_Screen.dart';

class MoviesStyle extends StatefulWidget {
  List<Movies> movies;
  int index;

  MoviesStyle({required this.movies, required this.index});

  @override
  State<MoviesStyle> createState() => _MoviesStyleState();
}

class _MoviesStyleState extends State<MoviesStyle> {
  bool isAdd = false;
  List<MoviesCloudStore> watchList = [];

  @override
  void initState() {
    super.initState();
    watchListMovies();
  }

  @override
  Widget build(BuildContext context) {
    final currentMovie = widget.movies[widget.index];
    // Check if current movie is in watchList
    isAdd = watchList.any((m) => m.id == currentMovie.id);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MoviesDetailsScreen(
                movieId: currentMovie.id,
                title: currentMovie.title,
              );
            },
          ),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              width: 96.87,
              height: 127.73,
              fit: BoxFit.fill,
              currentMovie.posterPath == null
                  ? "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"
                  : "https://image.tmdb.org/t/p/w500/${currentMovie
                  .posterPath}",
            ),
          ),
          GestureDetector(
            onTap: () {
              isAdd ? removeMovie() : addMovies();
              setState(() {
                watchListMovies();
                isAdd = !isAdd;
              });
            },
            child: Container(
              width: 27,
              height: 36,
              decoration: BoxDecoration(
                color: isAdd ? Color(0xffF7B539) : Color(0x98514f4f),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4)),
              ),
              child: Icon(isAdd ? Icons.check : Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void addMovies() async {
    var myMovies = MoviesCloudStore(
        rate: widget.movies[widget.index].voteAverage,
        name: widget.movies[widget.index].title,
        imgPath: widget.movies[widget.index].backdropPath,
        id: widget.movies[widget.index].id,
        date: widget.movies[widget.index].releaseDate
    );
    await MoviesCloudStoreDao.addMovies(myMovies);
  }

  void removeMovie() {
    MoviesCloudStoreDao.removeTask(widget.movies[widget.index].id ?? 0);
  }

  void watchListMovies() async {
    watchList = await MoviesCloudStoreDao.getAllWatchListMovies();
    setState(() {});
  }

}
