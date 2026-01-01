import 'package:flutter/material.dart' hide BackButton;
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled33333333/pages/cart.dart';
import 'package:untitled33333333/pages/profile.dart';
import 'package:untitled33333333/widgets/cart_button.dart';
import 'package:untitled33333333/widgets/navigation_bar.dart';
import 'package:untitled33333333/widgets/back_button.dart';
import '../generated/l10n.dart';
import '../services/preferences_service.dart';
import 'home.dart';
import 'orders.dart';

class Product extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final bool isFavorite;
  final String category;

  const Product({
    required this.name,
    required this.image,
    required this.price,
    this.isFavorite = false,
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

int selectedButton = 0;

class _ProductState extends State<Product> {
  int selectedIndex = 2;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
    PreferencesService.saveNavigationIndex(3);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 100),
      body: Stack(
        children: [
          Positioned(
            top: 110,
            child: Image.network(
              widget.image,
              width: 445,
              height: 345,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 465,
            left: 190,
            child: Container(width: 15, height: 10, decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color(0xff118844))),
          ),
          Positioned(
            top: 465,
            left: 220,
            child: Container(width: 15, height: 10, decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color(0xffEFEFEF))),
          ),
          Positioned(
            top: 465,
            left: 250,
            child: Container(width: 15, height: 10, decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color(0xffEFEFEF))),
          ),
          Positioned(
            top: 515,
            right: 40,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 25,
                color: Color(0xff118844),
              ),
            ),
          ),
          Positioned(
            top: 505,
            left: 19,
            child: Text(
              widget.name,
              style: GoogleFonts.poppins(
                fontSize: 30,
                color: Color(0xff515151),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 550,
            left: 19,
            child: Container(
              width: 53,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xffEFEFEF),
              ),
              alignment: Alignment.center,
              child: Text(
                S.of(context).locall,
                style: GoogleFonts.poppins(fontSize: 11, color: Color(0xff515151)),
              ),
            ),
          ),
          Positioned(
            top: 550,
            left: 80,
            child: Container(
              width: 62,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xffEFEFEF),
              ),
              alignment: Alignment.center,
              child: Text(
                S.of(context).organic,
                style: GoogleFonts.poppins(fontSize: 11, color: Color(0xff515151)),
              ),
            ),
          ),
          Positioned(
            top: 578,
            left: 22,
            child: Row(
              children: [
                Icon(Icons.star_rate_rounded, size: 20, color: Color(0xff95C6AA)),
                Icon(Icons.star_rate_rounded, size: 20, color: Color(0xff95C6AA)),
                Icon(Icons.star_rate_rounded, size: 20, color: Color(0xff95C6AA)),
                Icon(Icons.star_rate_rounded, size: 20, color: Color(0xff95C6AA)),
                Icon(Icons.star_half_rounded, size: 20, color: Color(0xff95C6AA)),
                Text("  4.5", style: GoogleFonts.poppins(fontSize: 11, color: Color(0xff515151))),
              ],
            ),
          ),
          Positioned(
            top: 620,
            left: 5,
            child: Container(
              width: 418,
              height: 230,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffFBFBFB),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3, spreadRadius: 1, offset: Offset(0, 1.5))],
              ),
            ),
          ),
          Positioned(
            top: 650,
            left: 50,
            child: Row(
              children: [
                Text(
                  "SR ${widget.price}",
                  style: GoogleFonts.poppins(fontSize: 22, color: Color(0xff95C6AA), fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 210),
                Text("-", style: GoogleFonts.poppins(fontSize: 16, color: Color(0xff909090), fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Text("1", style: GoogleFonts.poppins(fontSize: 16, color: Color(0xff515151), fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Text("+", style: GoogleFonts.poppins(fontSize: 16, color: Color(0xff118844), fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Positioned(
            top: 685,
            left: 50,
            child: Row(
              children: List.generate(4, (index) {
                String text;
                switch (index) {
                  case 0:
                    text = "1/4 Kilo";
                    break;
                  case 1:
                    text = "1/2 Kilo";
                    break;
                  case 2:
                    text = "1 Kilo";
                    break;
                  default:
                    text = "2 Kilo";
                }
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = index + 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButton == index + 1 ? Color(0xffD3D3D3) : Color(0xffEFEFEF),
                      minimumSize: Size(70, 30),
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      elevation: 4,
                      shadowColor: Colors.black26,
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Color(0xff515151),
                        fontWeight: selectedButton == index + 1 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            top: 739,
            left: 50,
            child: Text(
              S.of(context).total,
              style: GoogleFonts.poppins(fontSize: 18, color: Color(0xff515151), fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 737,
            right: 60,
            child: Text(
              "SR ${widget.price}",
              style: GoogleFonts.poppins(fontSize: 22, color: Color(0xff95C6AA), fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 780,
            left: 55,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: Container(
                width: 340,
                height: 60,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff95C6AA)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).addToCart,
                      style: GoogleFonts.poppins(fontSize: 20, color: Color(0xffFBFBFB), fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.shopping_cart, size: 30, color: Color(0xffFBFBFB)),
                  ],
                ),
              ),
            ),
          ),
          NavigationBarr(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
              if (index == 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              } else if (index == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Orders()));
              } else if (index == 2) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Product(
                  name: widget.name,
                  image: widget.image,
                  price: widget.price,
                  isFavorite: isFavorite,
                  category: widget.category,
                )));
              } else if (index == 3) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
              }
            },
          ),
          Positioned(
            top: 55,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: BackButton(),
            ),
          ),
          Positioned(
            top: 55,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: CartButton(),
            ),
          ),
        ],
      ),
    );
  }
}
