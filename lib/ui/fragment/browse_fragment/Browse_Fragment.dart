import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/api/Api_Manager.dart';
import 'package:movies/api/model/browse_category_response/browse_category_response.dart';
import 'package:movies/ui/widget/category_style/Category_Style.dart';

class BrowseFragment extends StatelessWidget {
  const BrowseFragment({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Browse Category',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            FutureBuilder(
              future: ApiManager.getCategoryMovies(),
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
                  return Expanded(
                    child: GridView.builder(
                      itemCount: snapshot.data?.genres.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: width * 0.25,
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 25),
                      itemBuilder: (context, index) {
                        return CategoryStyle(
                            genre: snapshot.data!.genres, index: index);
                      },),
                  );
                }
              },)
          ],
        ),
      ),
    );
  }
}
