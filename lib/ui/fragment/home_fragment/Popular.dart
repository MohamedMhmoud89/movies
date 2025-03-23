import 'package:flutter/material.dart';
import 'package:movies/api/Api_Manager.dart';
import 'package:movies/api/model/popular_response/Movies_Response.dart';
import 'package:movies/ui/movies_detials_screen/Movies_Details_Screen.dart';
import 'package:movies/ui/widget/top%20_side_section/Top_Side_Section.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movies_Response>(
      future: ApiManager.getMovies('popular'),
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
          return CarouselSlider(
            options: CarouselOptions(
              height: 289,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 6),
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
            ),
            items:
                snapshot.data!.results?.map((item) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return MoviesDetailsScreen(
                                movieId: item.id,
                                title: item.title,
                              );
                            },
                          ),
                        );
                      },
                      child: TopSideSection(movies: item),
                    ),
                  );
                }).toList(),
          );
        }
      },
    );
  }
}
