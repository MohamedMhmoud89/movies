import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158,
      height: 90,
      decoration: BoxDecoration(
        color: Color(0xff343534),
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          image: AssetImage('assets/images/category-testpng.png'),
        ),
      ),
      child: Center(
        child: Text(
          'Action',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
