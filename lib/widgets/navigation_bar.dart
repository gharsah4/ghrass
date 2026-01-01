import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled33333333/pages/checkout.dart';
import 'package:untitled33333333/pages/home.dart';
import 'package:untitled33333333/pages/product.dart';
import 'package:untitled33333333/pages/vegetables.dart';

import '../generated/l10n.dart';

//class NavigationBarr extends StatefulWidget{
  // NavigationBarr();

  //@override
  //State<NavigationBarr> createState() => _NavigationBarrState();
//}

//class _NavigationBarrState extends State<NavigationBarr> {
  /*int myIndex = 0;
  List<Widget> widgetList = [
    Home(),
    Vegetables(),
    Product(),
    Checkout(),
  ];*/
  //@override
  //Widget build(BuildContext context) {
    //return

class NavigationBarr extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

   NavigationBarr({
    required this.currentIndex,
    required this.onTap,
  });

  Color activeColor = const Color(0xff176238);
  Color inactiveColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        decoration: BoxDecoration(
          color: const Color(0xffFBFBFB),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              index: 0,
              label: (S.of(context).home),
              icon: 'assets/images/home_icon.png',
            ),
            _navItem(
              index: 1,
              label: (S.of(context).orders),
              icon: 'assets/images/orders_icon.png',
            ),
            _navItem(
              index: 2,
              label: (S.of(context).offers),
              icon: 'assets/images/offers_icon.png',
            ),
            _navItem(
              index: 3,
              label: (S.of(context).profile),
              icon: 'assets/images/profile_icon.png',
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required int index,
    required String label,
    required String icon,
  }) {
    final isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: 32,
            height: 32,
            color: isActive ? Color(0xff176238) : Colors.black,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: isActive ? Color(0xff176238) : Colors.black,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

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
          fontWeight: FontWeight.bold,
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
    );
  }
}*/
      /*Positioned(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {return Product();},
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
  }
}*/