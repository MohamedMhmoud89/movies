import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/api/model/Movies.dart';
import 'package:movies/ui/widget/movies_widget/Movies_Style.dart';

class MoviesGroup extends StatelessWidget {
  String groupName;
  List<Movies> movies;

  MoviesGroup({required this.groupName, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18, top: 14, bottom: 14, right: 8),
      color: Color(0xff282A28),
      height: 187,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            groupName,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(width: 20);
              },
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MoviesStyle(movies: movies, index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
