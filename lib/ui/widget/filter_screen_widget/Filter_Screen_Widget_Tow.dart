import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/api/model/Movies.dart';
import 'package:movies/db/Movies_Cloud_Store_Dao.dart';
import 'package:movies/db/model/Movies_Cloud_Store.dart';
import 'package:movies/ui/screen/movies_detials_screen/Movies_Details_Screen.dart';

class FilterScreenWidget extends StatefulWidget {
  List<MoviesCloudStore> movies;
  int index;

  FilterScreenWidget({required this.movies, required this.index});

  @override
  State<FilterScreenWidget> createState() => _FilterScreenWidgetState();
}

class _FilterScreenWidgetState extends State<FilterScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return MoviesDetailsScreen(
                title: widget.movies[widget.index].name,
                movieId: widget.movies[widget.index].id,
              );
            },
          ),
        );
      },
      child: Container(
        height: 89,
        child: Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.movies[widget.index].imgPath == null
                        ? "https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"
                        : 'https://image.tmdb.org/t/p/w500/${widget.movies[widget.index].imgPath}',
                    width: 140,
                    height: 89,
                    fit: BoxFit.fill,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    MoviesCloudStoreDao.removeTask(
                      widget.movies![widget.index].id ?? 0,
                    );
                    setState(() {});
                  },
                  child: Container(
                    width: 27,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Color(0xffF7B539),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                      ),
                    ),
                    child: Icon(Icons.check, color: Colors.white),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.movies[widget.index].name ?? "",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      Text(
                        '${widget.movies[widget.index].date}',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffB5B4B4),
                          ),
                        ),
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Image.asset('assets/images/star-2.png', width: 10),
                          Text(
                            '${widget.movies[widget.index].rate}',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffB5B4B4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
