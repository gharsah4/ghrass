import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomButton extends StatelessWidget{
  CustomButton({this.onTap ,required this.Btext});

  VoidCallback? onTap;
  String Btext;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 370,
        height: 65,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 8,
            backgroundColor: Color(0xff176238),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            //shadowColor: Color.fromARGB(25, 0, 0, 0),
          ),
          onPressed: onTap,
          child: Text(
            Btext,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xffF6EDED),
            ),),
        ),
      ),
    );
  }
}