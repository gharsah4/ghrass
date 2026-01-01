import 'package:flutter/material.dart' hide BackButton;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled33333333/pages/cart.dart';
import 'package:untitled33333333/widgets/cart_button.dart';
import '../generated/l10n.dart';
import '../services/favorites_service.dart';
import '../services/preferences_service.dart';
import '../widgets/vegetable_card.dart';
import '../widgets/back_button.dart' show BackButton;
import '../widgets/navigation_bar.dart';
import 'home.dart';
import 'orders.dart';
import 'fruits.dart';
import 'checkout.dart';

class Favorites extends StatefulWidget {
  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  int selectedIndex = 1;
  final FavoritesService _favoritesService = FavoritesService();

  @override
  void initState() {
    super.initState();
    PreferencesService.saveNavigationIndex(5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Home()),);
                    },
                    child: BackButton(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Cart()),);
                    },
                    child: CartButton(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).favorites,
              style: GoogleFonts.poppins(
                fontSize: 21,
                color: const Color(0xff95C6AA),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _favoritesService.favoritesStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text(
                        S.of(context).noFavorites,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }
                  final favorites = snapshot.data!.docs;
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    itemCount: favorites.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.05,
                    ),
                    itemBuilder: (context, index) {
                      final product = favorites[index];
                      return VegetableCard(
                        name: product['name'],
                        price: product['price'].toDouble(),
                        image: product['image'],
                        isFavorite: true,
                        onFavoriteTap: () {
                          _favoritesService.toggleFavorite(
                            productId: product.id,
                            isFavorite: true,
                            productData: {},
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarr(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Orders()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Fruits()));
          } else if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Checkout()));
          }
        },
      ),
    );
  }
}
