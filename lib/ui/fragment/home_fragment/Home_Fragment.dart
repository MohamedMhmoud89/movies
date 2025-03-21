import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/ui/widget/movies_group/Movies_Group.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            spacing: 20,
            children: [
              Container(
                height: 289,
                child: Stack(
                  children: [
                    Container(
                      height: 217,
                      width: double.infinity,
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
                    Positioned(
                      top: height * 0.09,
                      left: width * 0.05,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Image.asset(
                              'assets/images/Image-test.png',
                              height: 199,
                              width: 129,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 14,
                              bottom: 19,
                            ),
                            child: Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dora and the lost city of gold',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Text(
                                  '2019  PG-13  2h 7m',
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              MoviesGroup(groupName: 'New Releases'),
              MoviesGroup(groupName: 'Recomended'),
            ],
          ),
        ),
      ),
    );
  }
}
