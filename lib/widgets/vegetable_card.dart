import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../generated/l10n.dart';

class VegetableCard extends StatelessWidget {
  final String name;
  final String image;
  final double price;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onAddToCart;

  const VegetableCard({
    required this.name,
    required this.image,
    required this.price,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteTap,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 158,
        height: 180,
        margin: EdgeInsets.all(10),
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
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: onTap,
                child: Center(
                  child: Image.network(
                    image,
                    width: 90,
                    height: 90,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 45,
              left: 10,
              child: Text(
                '1 Kilo',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Color(0xff515151),
                ),
              ),
            ),
            Positioned(
              bottom: 45,
              right: 10,
              child: Text(
                'SR $price',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Color(0xff515151),
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              left: 30,
              child: GestureDetector(
                onTap: onAddToCart,
                child: Text(
                  S.of(context).addToCart,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Color(0xff95C6AA),
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
              ),
            Positioned(
              bottom: 8,
              right: 30,
              child: Container(
                width: 19,
                height: 19,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff95C6AA),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: GestureDetector(
                  onTap: onAddToCart,
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Color(0xff95C6AA),
                  ),
                ),
              ),
            ),

            /*Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: onAddToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff95C6AA),
                  minimumSize: Size(double.infinity, 28),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon: Icon(
                  Icons.add_shopping_cart,
                  size: 16,
                  color: Colors.white,
                ),
                label: Text(
                  S.of(context).addToCart,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),*/

            Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: onFavoriteTap,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 22,
                  color: Color(0xff118844),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
