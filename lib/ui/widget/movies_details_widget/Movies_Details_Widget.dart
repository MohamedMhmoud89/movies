import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/api/model/movies_details_response/MoviesDetailsResponse.dart';

class MoviesDetailsWidget extends StatelessWidget {
  MoviesDetailsResponse? moviesDetailsResponse;

  MoviesDetailsWidget({required this.moviesDetailsResponse});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                    moviesDetailsResponse?.backdropPath == null
                        ? "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"
                        : "https://image.tmdb.org/t/p/w500/${moviesDetailsResponse?.backdropPath}",
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
                    moviesDetailsResponse?.title ?? "",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    '${moviesDetailsResponse?.releaseDate}   ${moviesDetailsResponse!.runtime! ~/ 60}h ${moviesDetailsResponse!.runtime! % 60}m',
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
                      Image.network(
                        moviesDetailsResponse?.posterPath == null
                            ? "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"
                            : "https://image.tmdb.org/t/p/w500/${moviesDetailsResponse?.posterPath}",
                        width: 129,
                        height: 199,
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
                              "${moviesDetailsResponse!.genres?[0].name}",
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
                              moviesDetailsResponse?.overview ?? "",
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
                                "${moviesDetailsResponse?.voteAverage}",
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
}
