import 'package:flutter/material.dart';
import 'package:movies/ui/fragment/home_fragment/Popular.dart';
import 'package:movies/ui/widget/movies_widget/Movies_Widget.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            spacing: 20,
            children: [
              Popular(),
              MoviesWidget(apiName: 'upcoming', groupName: 'Upcoming'),
              MoviesWidget(apiName: 'now_playing', groupName: 'Now Playing'),
              MoviesWidget(apiName: 'top_rated', groupName: 'Top Rated'),
            ],
          ),
        ),
      ),
    );
  }
}
