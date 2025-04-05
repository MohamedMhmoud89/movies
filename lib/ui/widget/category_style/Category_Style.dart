import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/api/model/browse_category_response/browse_category_response.dart';
import 'package:movies/ui/screen/filter_screen/Filter_Screen.dart';

class CategoryStyle extends StatelessWidget {
  List<Genre> genre;
  int index;

  CategoryStyle({required this.genre, required this.index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return FilterScreen(
                genresId: "${genre[index].id}",
                genresName: genre[index].name,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff343534),
          borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color: Color(0xffFFBB3B), style: BorderStyle.solid, width: 1)
        ),
        child: Center(
          child: Text(
            genre[index].name,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
