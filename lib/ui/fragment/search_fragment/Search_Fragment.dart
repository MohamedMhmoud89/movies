import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/api/Api_Manager.dart';
import 'package:movies/ui/widget/filter_screen_widget/Filter_Screen_Widget.dart';

class SearchFragment extends StatefulWidget {
  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            decoration: BoxDecoration(
              color: Color(0xff514F4F),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Color(0x9dffffff), width: 2),
            ),
            child: TextField(
              controller: searchController,
              cursorColor: Colors.white,
              autocorrect: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: height * 0.015),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: Icon(Icons.search_rounded, color: Colors.white),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: ApiManager.searchMovies(searchController.text),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: Color(0xffFFBB3B)),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error : ${snapshot.error}',
                    style: TextStyle(color: Colors.white),
                  ),
                ); // في حالة حدوث خطأ
              } else if (!snapshot.hasData) {
                return Center(child: Text('لا توجد بيانات متاحة'));
              } else if (snapshot.data!.results!.isEmpty) {
                return Center(
                  child: Column(
                    spacing: 15,
                    children: [
                      Image.asset(
                        'assets/images/Icon material-local-movies.png',
                      ),
                      Text(
                        'No movies found',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    itemCount: snapshot.data!.results!.length,
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
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
