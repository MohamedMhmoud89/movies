import 'package:flutter/material.dart';
import 'package:movies/api/model/more_like_this_section/MoreLikeThisSection.dart';
import 'package:movies/api/model/popular_response/Movies.dart';
import 'package:movies/ui/movies_detials_screen/Movies_Details_Screen.dart';

class LikeMoreStyle extends StatelessWidget {
  List<MoreLikeThisSection> moreLikeThisSection;
  int index;

  LikeMoreStyle({required this.moreLikeThisSection, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MoviesDetailsScreen(
                movieId: moreLikeThisSection[index].id,
                title: moreLikeThisSection[index].title,
              );
            },
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          moreLikeThisSection[index].posterPath == null
              ? "https://as1.ftcdn.net/jpg/04/71/40/86/500_F_471408635_2IPbyYGIgtQ8mjbegDExyeMWqNTLUlD4.jpg"
              : "https://image.tmdb.org/t/p/w500/${moreLikeThisSection[index].posterPath}",
        ),
      ),
    );
  }
}
