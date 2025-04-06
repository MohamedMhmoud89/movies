import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/api/model/movies_details_response/MoviesDetailsResponse.dart';
import 'package:movies/db/Movies_Cloud_Store_Dao.dart';
import 'package:movies/db/model/Movies_Cloud_Store.dart';

class MoviesDetailsWidget extends StatefulWidget {
  MoviesDetailsResponse? moviesDetailsResponse;

  MoviesDetailsWidget({required this.moviesDetailsResponse});

  @override
  State<MoviesDetailsWidget> createState() => _MoviesDetailsWidgetState();
}

class _MoviesDetailsWidgetState extends State<MoviesDetailsWidget> {
  bool isAdd = false;

  List<MoviesCloudStore> watchList = [];

  @override
  void initState() {
    super.initState();
    watchListMovies();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final currentMovie = widget.moviesDetailsResponse;
    // Check if current movie is in watchList
    isAdd = watchList.any((m) => m.id == currentMovie?.id);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.02),
        child: Column(
          spacing: height * 0.02,
          children: [
            Container(
              width: double.infinity,
              height: 217,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    widget.moviesDetailsResponse?.backdropPath == null
                        ? "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"
                        : "https://image.tmdb.org/t/p/w500/${widget.moviesDetailsResponse?.backdropPath}",
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.moviesDetailsResponse?.title ?? "",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    '${widget.moviesDetailsResponse?.releaseDate}   ${widget.moviesDetailsResponse!.runtime! ~/ 60}h ${widget.moviesDetailsResponse!.runtime! % 60}m',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Color(0xa3ffffff),
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    spacing: width * 0.05,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              widget.moviesDetailsResponse?.posterPath == null
                                  ? "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"
                                  : "https://image.tmdb.org/t/p/w500/${widget.moviesDetailsResponse?.posterPath}",
                              width: 129,
                              height: 199,
                            ),
                          ),
                          Positioned(
                            top: height * 0.003,
                            child: GestureDetector(
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
                                  color:
                                      isAdd
                                          ? Color(0xffF7B539)
                                          : Color(0x98514f4f),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4),
                                  ),
                                ),
                                child: Icon(
                                  isAdd ? Icons.check : Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: height * 0.01,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 17,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Color(0xff514F4F)),
                            ),
                            child: Text(
                              "${widget.moviesDetailsResponse!.genres?[0].name}",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.5,
                            child: Text(
                              widget.moviesDetailsResponse?.overview ?? "",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            spacing: width * 0.01,
                            children: [
                              Image.asset('assets/images/star-2.png'),
                              Text(
                                "${widget.moviesDetailsResponse?.voteAverage}",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
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
      rate: widget.moviesDetailsResponse?.voteAverage,
      name: widget.moviesDetailsResponse?.title,
      imgPath: widget.moviesDetailsResponse?.backdropPath,
      id: widget.moviesDetailsResponse?.id,
      date: widget.moviesDetailsResponse?.releaseDate,
    );
    await MoviesCloudStoreDao.addMovies(myMovies);
  }

  void removeMovie() {
    MoviesCloudStoreDao.removeTask(widget.moviesDetailsResponse?.id ?? 0);
  }

  void watchListMovies() async {
    watchList = await MoviesCloudStoreDao.getAllWatchListMovies();
    setState(() {});
  }
}
