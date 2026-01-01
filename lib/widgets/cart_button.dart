import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartButton extends StatelessWidget{
  CartButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xffFBFBFB),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(0, 1.5),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.shopping_cart,
            size: 20,
            color: Color(0xff515151),
          ),
        ),
      ),
    );
  }
}