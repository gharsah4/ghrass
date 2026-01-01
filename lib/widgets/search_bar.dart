import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../generated/l10n.dart';

class SearchBar extends StatefulWidget {
  SearchBar();

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 112,
              left: 19,
              child: Container(
                width: 310,
                margin: const EdgeInsets.all(21),
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    border: InputBorder.none,
                    hintText: (S.of(context).search),
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Color(0xff909090),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 143,
              left: 48,
              child: Image.asset(
                'assets/images/search_icon.jpg',
                width: 25,
                height: 25,
                fit: BoxFit.contain,
                color: Color(0xff909090),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
