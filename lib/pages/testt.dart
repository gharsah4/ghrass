import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled33333333/pages/checkout.dart';
import 'package:untitled33333333/pages/home.dart';
import 'package:untitled33333333/pages/product.dart';
import 'package:untitled33333333/pages/vegetables.dart';

import 'fruits.dart';

class Testt extends StatefulWidget{
  Testt();

  @override
  State<Testt> createState() => _TesttState();
}

class _TesttState extends State<Testt> {
  /*int myIndex = 0;
  List<Widget> widgetList = [
    Home(),
    Vegetables(),
    Product(),
    Checkout(),
  ];*/
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: 450,
        height: 90,
        decoration: BoxDecoration(
          color: Color(0xffFBFBFB),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 40,
              left: 47,
              child: GestureDetector(
                onTap: () {
                  setState(() {

                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) {return Fruits();},
                  ),
                  );
                },
                child: Image.asset(
                  'assets/images/home_icon.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 50,
              child: Text(
                "Home",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 165,
              child: Image.asset(
                'assets/images/orders_icon.png',
                width: 27,
                height: 27,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 155,
              child: Text(
                "Orders",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 153,
              child: Image.asset(
                'assets/images/offers_icon.png',
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 148,
              child: Text(
                "Offers",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              bottom: 48,
              right: 60,
              child: Image.asset(
                'assets/images/profile_icon.png',
                width: 30,
                height: 30,
                color: Color(0xff176238),
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 50,
              child: Text(
                "Profile",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Color(0xff176238),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    /*Scaffold(
      body: IndexedStack(
        children: widgetList,
        index: myIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xffFBFBFB),
        showUnselectedLabels: false,
        selectedItemColor: Color(0xff176238),
        unselectedItemColor: Colors.black,
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 15,
          color: Color(0xff176238),
          fontWeight: FontWeight.normal,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        onTap: (index){
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        type: BottomNavigationBarType.fixed,
        items: const[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home' ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded),
              label: 'Orders' ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_rounded),
              label: 'Offers' ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile' ),
        ],
      ),
    );*/
  }
}