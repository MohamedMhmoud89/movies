import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/api/model/Movies.dart';
import 'package:movies/ui/screen/movies_detials_screen/Movies_Details_Screen.dart';

class FilterScreenWidget extends StatelessWidget {
  List<Movies> movies;
  int index;

  FilterScreenWidget({required this.movies, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MoviesDetailsScreen(
                title: movies[index].title,
                movieId: movies[index].id,
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                movies[index].backdropPath == null
                    ? "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"
                    : 'https://image.tmdb.org/t/p/w500/${movies[index].backdropPath}',
                width: 140,
                height: 89,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movies[index].title ?? "",
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
                        '${movies[index].releaseDate}',
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
                            '${movies[index].voteAverage}',
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
}
