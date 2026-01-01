import 'package:flutter/material.dart' hide BackButton;
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled33333333/pages/cart.dart';
import 'package:untitled33333333/pages/fruits.dart';
import 'package:untitled33333333/pages/location.dart';
import 'package:untitled33333333/pages/orders.dart';
import 'package:untitled33333333/pages/product.dart';
import 'package:untitled33333333/pages/profile.dart';
import 'package:untitled33333333/pages/vegetables.dart';
import 'package:untitled33333333/widgets/cart_button.dart';
import 'package:untitled33333333/widgets/navigation_bar.dart';
import 'package:untitled33333333/widgets/back_button.dart';
import '../generated/l10n.dart';
import '../main.dart';
import '../services/preferences_service.dart';
import 'checkout.dart';

void main() {
  runApp(GherasApp() as Widget);
}

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    PreferencesService.saveNavigationIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(255, 255, 255, 100),
        body: Stack(
          children: [
            Positioned(
              top: 200,
              left: 29,
              child: Text(
                (S.of(context).discounts),
                style: GoogleFonts.poppins(
                  fontSize: 21,
                  color: Color(0xff95C6AA),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 207,
              right: 75,
              child: Text(
                (S.of(context).seeAll),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xff909090),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 209,
              right: 60,
              child: Center(
                child: Transform.translate(
                  offset: Offset(4, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Color(0xff909090),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 230,
              left: 19,
              child: Container(
                width: 106,
                height: 117,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 248,
              left: 57,
              child: Text(
                (S.of(context).mango),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 273,
              left: 54,
              child: Image.asset(
                'assets/images/mango.png',
                width: 55,
                height: 55,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 335,
              left: 45,
              child: Text(
                "SR 15",
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Color(0xff515151),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 341,
              left: 43,
              child: Container(
                height: 1.5,
                width: 30,
                color: Color(0xff515151),
              ),
            ),
            Positioned(
              top: 335,
              left: 88,
              child: Text(
                "SR 11.5",
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Color(0xffD83535),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 230,
              left: 150,
              child: Container(
                width: 106,
                height: 117,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 248,
              left: 197,
              child: Text(
                (S.of(context).kiwi),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 263,
              left: 170,
              child: Image.asset(
                'assets/images/kiwi.png',
                width: 85,
                height: 85,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 335,
              left: 176,
              child: Text(
                "SR 12",
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Color(0xff515151),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 341,
              left: 174,
              child: Container(
                height: 1.5,
                width: 30,
                color: Color(0xff515151),
              ),
            ),
            Positioned(
              top: 335,
              left: 222,
              child: Text(
                "SR 9",
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Color(0xffD83535),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 230,
              left: 281,
              child: Container(
                width: 106,
                height: 117,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 248,
              left: 308,
              child: Text(
                (S.of(context).redApple),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 263,
              left: 311,
              child: Image.asset(
                'assets/images/red_apple.png',
                width: 70,
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 335,
              left: 307,
              child: Text(
                "SR 10",
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Color(0xff515151),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 341,
              left: 305,
              child: Container(
                height: 1.5,
                width: 30,
                color: Color(0xff515151),
              ),
            ),
            Positioned(
              top: 335,
              left: 353,
              child: Text(
                "SR 6",
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Color(0xffD83535),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 385,
              left: 29,
              child: Text(
                (S.of(context).categories),
                style: GoogleFonts.poppins(
                  fontSize: 21,
                  color: Color(0xff95C6AA),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 392,
              right: 75,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Vegetables();
                  },),);
                },
              child: Text(
                (S.of(context).seeAll),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xff909090),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),),
            Positioned(
              top: 394,
              right: 60,
              child: Center(
                child: Transform.translate(
                  offset: Offset(4, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Color(0xff909090),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 415,
              left: 19,
              child: Container(
                width: 106,
                height: 117,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 433,
              left: 42,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Vegetables();
                  },),);
                },
              child: Text(
                (S.of(context).vegetables),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),),
            Positioned(
              top: 453,
              left: 42,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Vegetables();
                  },),);
                },
              child: Image.asset(
                'assets/images/vegetables.png',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),),
            Positioned(
              top: 415,
              left: 150,
              child: Container(
                width: 106,
                height: 117,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 433,
              left: 193,
              child: Text(
                (S.of(context).fruits),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 455,
              left: 177,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Fruits();
                  },),);
                },
              child: Image.asset(
                'assets/images/fruits.png',
                width: 70,
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
            ),
            Positioned(
              top: 415,
              left: 281,
              child: Container(
                width: 106,
                height: 117,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 433,
              left: 309,
              child: Text(
                (S.of(context).seasonal),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 448,
              left: 302,
              child: Image.asset(
                'assets/images/seasonal.png',
                width: 85,
                height: 85,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 570,
              left: 29,
              child: Text(
                (S.of(context).newArrivals),
                style: GoogleFonts.poppins(
                  fontSize: 21,
                  color: Color(0xff95C6AA),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 577,
              right: 75,
              child: Text(
                (S.of(context).seeAll),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xff909090),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 579,
              right: 60,
              child: Center(
                child: Transform.translate(
                  offset: Offset(4, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Color(0xff909090),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 600,
              left: 19,
              child: Container(
                width: 106,
                height: 117,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 618,
              left: 43,
              child: Text(
                (S.of(context).strawberry),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 639,
              left: 48,
              child: Image.asset(
                'assets/images/strawberry.png',
                width: 65,
                height: 65,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 705,
              left: 68,
              child: Text(
                "SR 10",
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Color(0xff515151),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 600,
              left: 150,
              child: Container(
                width: 106,
                height: 117,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 618,
              left: 164,
              child: Text(
                (S.of(context).pomegranate),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 633,
              left: 175,
              child: Image.asset(
                'assets/images/pomegranate.png',
                width: 75,
                height: 75,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 705,
              left: 200,
              child: Text(
                "SR 12",
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Color(0xff515151),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 600,
              left: 281,
              child: Container(
                width: 106,
                height: 117,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 618,
              left: 304,
              child: Text(
                (S.of(context).asparagus),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 633,
              left: 305,
              child: Image.asset(
                'assets/images/asparagus.png',
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 705,
              left: 330,
              child: Text(
                "SR 25",
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Color(0xff515151),
                  fontWeight: FontWeight.normal,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Fruits()));
                } else if (index == 3) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                }
              },
            ),
            Positioned(
              top: 55,
              left: 20,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Location();
                  },),);
                },
                child: BackButton(),
              ),
            ),
            Positioned(
              top: 55,
              right: 20,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Cart();
                  },),);
                },
                child: CartButton(),
              ),
            ),
            Positioned(
              top: 95,
              left: 19,
              child: Container(
                width: 368,
                margin: const EdgeInsets.all(21),
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 1.5),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15
                    ),
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
              top: 127,
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
    );
  }
}
