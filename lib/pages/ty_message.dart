import 'package:flutter/material.dart' hide BackButton;
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled33333333/pages/checkout.dart';
import 'package:untitled33333333/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../generated/l10n.dart';
import 'orders.dart';
import 'welcome.dart';

class TyMessage extends StatefulWidget {
  final String orderId;

  const TyMessage({Key? key, required this.orderId}) : super(key: key);

  @override
  State<TyMessage> createState() => _TyMessageState();
}

class _TyMessageState extends State<TyMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 232,
              left: 34,
              child: Container(
                width: 362,
                height: 490,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  borderRadius: BorderRadius.circular(20),
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
              top: 275,
              left: 170,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xff6E6F6E), width: 5),
                ),
              ),
            ),
            Positioned(
              top: 285,
              left: 180,
              child: Icon(
                Icons.check_rounded,
                size: 80,
                color: Color(0xff118844),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 400),
                  Text(
                    (S.of(context).TyMessage),
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Color(0xff118844),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    (S.of(context).paymentMessage),
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Color(0xff868686),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${S.of(context).orderNumber} #${widget.orderId.substring(0, 8)}",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Color(0xff868686),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        backgroundColor: Color(0xff95C6AA),
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Orders()),
                              (route) => false,
                        );
                      },
                      child: Text(
                        (S.of(context).trackOrder),
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Color(0xffFBFBFB),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 300,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        backgroundColor: Color(0xff95C6AA),
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                              (route) => false,
                        );
                      },
                      child: Text(
                        (S.of(context).backToHome),
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Color(0xffFBFBFB),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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