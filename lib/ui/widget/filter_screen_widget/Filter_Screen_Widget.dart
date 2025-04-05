import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/api/model/Movies.dart';
import 'package:movies/db/Movies_Cloud_Store_Dao.dart';
import 'package:movies/db/model/Movies_Cloud_Store.dart';
import 'package:movies/ui/screen/movies_detials_screen/Movies_Details_Screen.dart';

class FilterScreenWidget extends StatefulWidget {
  List<Movies> movies;
  int index;

  FilterScreenWidget({required this.movies, required this.index});

  @override
  State<FilterScreenWidget> createState() => _FilterScreenWidgetState();
}

class _FilterScreenWidgetState extends State<FilterScreenWidget> {
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
                title: widget.movies[widget.index].title,
                movieId: widget.movies[widget.index].id,
              );
            },
          ),
        );
      },
      child: Container(
        height: 89,
        child: Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.movies[widget.index].backdropPath == null
                        ? "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"
                        : 'https://image.tmdb.org/t/p/w500/${widget
                        .movies[widget.index].backdropPath}',
                    width: 140,
                    height: 89,
                    fit: BoxFit.fill,
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0)),
                    ),
                    child: Icon(
                      isAdd ? Icons.check : Icons.add, color: Colors.white,),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.movies[widget.index].title ?? "",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      Text(
                        '${widget.movies[widget.index].releaseDate}',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffB5B4B4),
                          ),
                        ),
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Image.asset('assets/images/star-2.png', width: 10),
                          Text(
                            '${widget.movies[widget.index].voteAverage}',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffB5B4B4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
