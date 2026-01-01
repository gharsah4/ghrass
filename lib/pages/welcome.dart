import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled33333333/pages/signup.dart';
import '../generated/l10n.dart';
import 'login.dart';

class Welcome extends StatelessWidget {
  Welcome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6F7E9),
        body: Column(
          children: [
            SizedBox(height: 60),
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 300,
                  width: 300,
                ),
              ),
            SizedBox(height: 30),
              Center(
                child: Text(
                  (S.of(context).welcome),
                  style: GoogleFonts.italiana(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  S.of(context).theBest,
                  style: GoogleFonts.italiana(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      backgroundColor: Color(0xff176238),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //shadowColor: Color.fromARGB(25, 0, 0, 0),
                    ),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return SignUp();
                          },),);
                        },
                    child: Text(
                      (S.of(context).SignUp),
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ),
                  SizedBox(width: 80),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      backgroundColor: Color(0xffF8F7F5),
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //shadowColor: Color.fromARGB(25, 0, 0, 0),
                    ),
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return LogIn();
                          },),);
                        },
                    child: Text(
                      (S.of(context).LogIn),
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
    );
  }
}