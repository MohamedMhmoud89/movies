import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({super.key});

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  var text = 'play';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.08),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Color(0xff514F4F),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Color(0xa3ffffff), width: 2),
            ),
            child: TextField(
              controller: searchController,
              onSubmitted: (value) {
                setState(() {
                  text = searchController.text;
                });
              },
              style: TextStyle(color: Colors.white),
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Search',
                hintStyle: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: Color(0xa3ffffff),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                prefixIcon: IconButton(
                  onPressed: () {
                    text = searchController.text;
                    setState(() {});
                  },
                  icon: Icon(Icons.search, color: Colors.white, size: 30),
                ),
              ),
            ),
          ),
          Center(child: Text(text, style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
