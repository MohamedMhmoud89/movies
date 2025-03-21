import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/ui/widget/movies_style/Movies_Style.dart';

class MoviesGroup extends StatelessWidget {
  String groupName;

  MoviesGroup({required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18, top: 14, bottom: 14),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MoviesStyle(image: 'assets/images/Image-test.png'),
                MoviesStyle(image: 'assets/images/Image-test.png'),
                MoviesStyle(image: 'assets/images/Image-test.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
