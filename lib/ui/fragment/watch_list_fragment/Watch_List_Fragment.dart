import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/db/Movies_Cloud_Store_Dao.dart';
import 'package:movies/ui/widget/filter_screen_widget/Filter_Screen_Widget_Tow.dart';

class WatchListFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Watchlist',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            StreamBuilder(
              stream: MoviesCloudStoreDao.listenForTasks(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        Text("SomeThing went wrong. please try again"),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.refresh_rounded),
                        ),
                      ],
                    ),
                  );
                }
                var moviesList = snapshot.data;
                return Expanded(
                  child: ListView.separated(
                    itemBuilder:
                        (context, index) => FilterScreenWidget(
                          movies: moviesList ?? [],
                          index: index,
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemCount: moviesList?.length ?? 0,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
