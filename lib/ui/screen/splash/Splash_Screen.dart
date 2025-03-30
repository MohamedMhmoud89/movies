import 'package:flutter/material.dart';
import 'package:movies/ui/screen/home/Home_Screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash_Screen';

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      body: Center(
        child: Container(child: Image.asset('assets/images/movies-icon.png')),
      ),
    );
  }
}
