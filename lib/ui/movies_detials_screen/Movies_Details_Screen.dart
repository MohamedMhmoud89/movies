import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/ui/widget/movies_group/Movies_Group.dart';

class MoviesDetailsScreen extends StatelessWidget {
  static const String routeName = 'movies_details_screen';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dora and the lost city of gold',
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
                    image: AssetImage('assets/images/test-video.png'),
                  ),
                ),
                child: Icon(
                  Icons.play_circle_fill_rounded,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Dora and the lost city of gold',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text(
                      '2019  PG-13  2h 7m',
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
                        Image.asset(
                          'assets/images/Image-test.png',
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
                                'Action',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '''Having spent 
          most of her 
          life exploring the jungle,
          nothing could prepare 
          Dora for her most 
          dangerous adventure yet — 
          high school. ''',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Row(
                              spacing: width * 0.01,
                              children: [
                                Image.asset('assets/images/star-2.png'),
                                Text(
                                  '7.7',
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
              MoviesGroup(groupName: 'More Like This'),
            ],
          ),
        ),
      ),
    );
  }
}
