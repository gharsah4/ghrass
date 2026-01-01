import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavoritee = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavoritee ? Icons.favorite : Icons.favorite_border,
        color: isFavoritee ? Color(0xff118844) : Colors.transparent,
        size: 32,
      ),
      onPressed: () {
        setState(() {
          isFavoritee = !isFavoritee;
        });
      },
    );
  }
}