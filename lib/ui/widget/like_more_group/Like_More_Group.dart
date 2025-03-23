import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/api/model/more_like_this_section/MoreLikeThisSection.dart';
import 'package:movies/api/model/popular_response/Movies.dart';
import 'package:movies/ui/widget/like_more_style/Like_More_Style.dart';
import 'package:movies/ui/widget/movies_style/Movies_Style.dart';

class LikeMoreGroup extends StatelessWidget {
  String groupName;
  List<MoreLikeThisSection> moreLikeThisSection;

  LikeMoreGroup({required this.groupName, required this.moreLikeThisSection});

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
              itemCount: moreLikeThisSection.length,
              itemBuilder: (context, index) {
                return LikeMoreStyle(
                  moreLikeThisSection: moreLikeThisSection,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
