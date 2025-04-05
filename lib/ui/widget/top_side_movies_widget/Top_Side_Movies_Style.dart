import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/api/model/Movies.dart';
import 'package:movies/db/Movies_Cloud_Store_Dao.dart';
import 'package:movies/db/model/Movies_Cloud_Store.dart';
import 'package:movies/utils/Dialog_Utils.dart';

class TopSideMoviesWidget extends StatefulWidget {
  Movies movies;

  TopSideMoviesWidget({required this.movies});

  @override
  State<TopSideMoviesWidget> createState() => _TopSideMoviesWidgetState();
}

class _TopSideMoviesWidgetState extends State<TopSideMoviesWidget> {
  bool isAdd = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: 289,
      child: Stack(
        children: [
          Container(
            height: 217,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${widget.movies
                      .backdropPath}" ?? "",
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.11,
            left: width * 0.05,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500${widget.movies
                            .posterPath}" ?? "",
                        height: 199,
                        width: 129,
                      ),
                    ),
                    Positioned(
                      top: height * 0.003,
                      child: GestureDetector(
                        onTap: () {
                          addMovies();
                          isAdd ? isAdd = false : isAdd = true;
                          setState(() {});
                        },
                        child: Container(
                          width: 27,
                          height: 36,
                          decoration: BoxDecoration(
                            color: isAdd ? Color(0xffF7B539) : Color(
                                0x98514f4f),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0)),
                          ),
                          child: Icon(isAdd ? Icons.check : Icons.add,
                            color: Colors.white,),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 19),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movies.originalTitle ?? "",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          Text(
                            "${widget.movies.releaseDate}",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Color(0xffB5B4B4),
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Image.asset(
                                'assets/images/star-2.png',
                                width: 10,
                              ),
                              Text(
                                "${widget.movies.voteAverage}",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Color(0xffB5B4B4),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
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
        ],
      ),
    );
  }

  void addMovies() async {
    DialogUtils.showLoadingDialog(context, "Loading....");
    var myMovies = MoviesCloudStore(
        rate: widget.movies.voteAverage,
        name: widget.movies.title,
        imgPath: widget.movies.backdropPath,
        id: widget.movies.id,
        date: widget.movies.releaseDate
    );
    await MoviesCloudStoreDao.addMovies(myMovies);
    DialogUtils.hideDialog(context);
  }
}
