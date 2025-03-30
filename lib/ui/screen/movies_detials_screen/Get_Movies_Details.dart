import 'package:flutter/material.dart';
import 'package:movies/api/Api_Manager.dart';
import 'package:movies/api/model/movies_details_response/MoviesDetailsResponse.dart';
import 'package:movies/ui/widget/movies_details_widget/Movies_Details_Widget.dart';

class GetMoviesDetails extends StatelessWidget {
  int movieId;

  GetMoviesDetails({required this.movieId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesDetailsResponse>(
      future: ApiManager.getMoviesDetails(movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xffFFBB3B)),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              ' Error: ${snapshot.error}',
              style: TextStyle(color: Colors.white),
            ),
          ); // في حالة حدوث خطأ
        } else if (!snapshot.hasData) {
          return Center(child: Text('لا توجد بيانات متاحة'));
        } else {
          return MoviesDetailsWidget(moviesDetailsResponse: snapshot.data);
        }
      },
    );
  }
}
