import 'package:flutter/material.dart';
import 'package:movies/api/Api_Manager.dart';
import 'package:movies/ui/widget/like_more_group/Like_More_Group.dart';
import 'package:movies/ui/widget/movies_group/Movies_Group.dart';

class MoreLikeMovies extends StatelessWidget {
  int movieId;

  MoreLikeMovies({required this.movieId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getLikeMoreMovies(movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xffFFBB3B)),
          );
        }
        else if (snapshot.hasError) {
          return Center(
            child: Text(
              ' Error: ${snapshot.error}',
              style: TextStyle(color: Colors.white),
            ),
          ); // في حالة حدوث خطأ
        }
        else if (!snapshot.hasData) {
          return Center(child: Text('لا توجد بيانات متاحة'));
        }
        else if (snapshot.data!.results!.isEmpty) {
          return Container();
        }
        else {
          return LikeMoreGroup(
              groupName: 'More Like This',
              moreLikeThisSection: snapshot.data!.results ?? []);
        }
      },
    );
  }
}
