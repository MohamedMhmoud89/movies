import 'package:flutter/material.dart';
import 'package:movies/ui/movies_detials_screen/Movies_Details_Screen.dart';

class MoviesStyle extends StatelessWidget {
  String image;

  MoviesStyle({required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MoviesDetailsScreen.routeName);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.asset(
          image,
          height: 127.73600006103516,
          width: 96.87360382080078,
        ),
      ),
    );
  }
}
