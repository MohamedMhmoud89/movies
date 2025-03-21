import 'package:flutter/material.dart';
import 'package:movies/ui/home/Home_Screen.dart';
import 'package:movies/ui/movies_detials_screen/Movies_Details_Screen.dart';
import 'package:movies/ui/splash/Splash_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          toolbarHeight: 20,
          backgroundColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Color(0xff121312),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xff1A1A1A),
          selectedIconTheme: IconThemeData(color: Color(0xffFFBB3B)),
          selectedItemColor: Color(0xffFFBB3B),
          unselectedItemColor: Colors.white,
          unselectedIconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        MoviesDetailsScreen.routeName: (_) => MoviesDetailsScreen(),
      },
    );
  }
}
