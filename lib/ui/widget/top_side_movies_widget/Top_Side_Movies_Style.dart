import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/api/model/Movies.dart';

class TopSideMoviesWidget extends StatelessWidget {
  Movies movies;

  TopSideMoviesWidget({required this.movies});

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
                  "https://image.tmdb.org/t/p/w500${movies.backdropPath}" ?? "",
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${movies.posterPath}" ?? "",
                    height: 199,
                    width: 129,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 19),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movies.originalTitle ?? "",
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
                            "${movies.releaseDate}",
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
                                "${movies.voteAverage}",
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
}
