import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchListStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        spacing: width * 0.03,
        children: [
          Image.asset('assets/images/watch-test.png'),
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alita Battle Angel',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '2019',
                style: GoogleFonts.inter(
                  color: Color(0xa3ffffff),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Rosa Salazar, Christoph Waltz',
                style: GoogleFonts.inter(
                  color: Color(0xa3ffffff),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
