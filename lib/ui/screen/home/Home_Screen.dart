import 'package:flutter/material.dart';
import 'package:movies/ui/fragment/browse_fragment/Browse_Fragment.dart';
import 'package:movies/ui/fragment/home_fragment/Home_Fragment.dart';
import 'package:movies/ui/fragment/search_fragment/Search_Fragment.dart';
import 'package:movies/ui/fragment/watch_list_fragment/Watch_List_Fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Browse"),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: "Watchlist",
          ),
        ],
      ),
      body: screens[selectedIndex],
    );
  }

  List<Widget> screens = [
    HomeFragment(),
    SearchFragment(),
    BrowseFragment(),
    WatchListFragment(),
  ];
}
