import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/ui/movies_detials_screen/Get_Movies_Details.dart';
import 'package:movies/ui/movies_detials_screen/More_Like_Movies.dart';

class MoviesDetailsScreen extends StatelessWidget {
  static const String routeName = 'movies_details_screen';
  int? movieId;
  String? title;

  MoviesDetailsScreen({this.movieId, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title ?? "",
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ),
        toolbarHeight: 30,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            GetMoviesDetails(movieId: movieId ?? 1),
            MoreLikeMovies(movieId: movieId ?? 1,),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
