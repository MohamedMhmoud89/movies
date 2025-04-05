import 'package:flutter/material.dart';
import 'package:movies/api/Api_Manager.dart';
import 'package:movies/ui/widget/filter_screen_widget/Filter_Screen_Widget.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = 'filter_screen';
  String? genresName;
  String? genresId;

  FilterScreen({this.genresName, this.genresId});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('${genresName} Movies')),
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: FutureBuilder(
          future: ApiManager.getMoviesByGenres(genresId ?? "1"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: Color(0xffFFBB3B)),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'حدث خطأ: ${snapshot.error}',
                  style: TextStyle(color: Colors.white),
                ),
              ); // في حالة حدوث خطأ
            } else if (!snapshot.hasData) {
              return Center(child: Text('لا توجد بيانات متاحة'));
            } else {
              return ListView.separated(
                itemCount: snapshot.data?.results?.length ?? 1,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Color(0xff707070),
                    height: 25,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  );
                },
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: FilterScreenWidget(
                      movies: snapshot.data?.results ?? [],
                      index: index,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
