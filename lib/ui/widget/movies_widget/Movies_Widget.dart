import 'package:flutter/material.dart';
import 'package:movies/api/Api_Manager.dart';
import 'package:movies/api/model/popular_response/Movies_Response.dart';
import 'package:movies/ui/widget/movies_group/Movies_Group.dart';

class MoviesWidget extends StatelessWidget {
  String apiName;
  String groupName;

  MoviesWidget({required this.apiName, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movies_Response>(
      future: ApiManager.getMovies(apiName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xffFFBB3B)),
          ); // جاري تحميل البيانات
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'حدث خطأ: ${snapshot.error}',
              style: TextStyle(color: Colors.white),
            ),
          ); // في حالة حدوث خطأ
        } else if (!snapshot.hasData) {
          return Center(
            child: Text('لا توجد بيانات متاحة'),
          ); // في حالة عدم وجود بيانات
        } else {
          return Column(
            children: [
              MoviesGroup(
                groupName: groupName,
                movies: snapshot.data!.results ?? [],
              ),
            ],
          );
        }
      },
    );
  }
}
