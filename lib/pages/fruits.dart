import 'package:flutter/material.dart' hide BackButton;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled33333333/pages/profile.dart';
import '../generated/l10n.dart';
import '../services/cart_service.dart';
import '../services/favorites_service.dart';
import '../services/preferences_service.dart';
import '../widgets/cart_item.dart';
import '../widgets/vegetable_card.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/cart_button.dart';
import '../widgets/back_button.dart';
import 'home.dart';
import 'cart.dart';
import 'orders.dart';
import 'product.dart';

class Fruits extends StatefulWidget {
  @override
  State<Fruits> createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  int selectedIndex = 2;
  List<CartItems> cartItems = [];

  final FavoritesService _favoritesService = FavoritesService();

  String searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  String getProductName(dynamic nameData) {
    if (nameData is Map) {
      final currentLanguage = Localizations.localeOf(context).languageCode;
      return nameData[currentLanguage] ?? nameData['en'] ?? '';
    }
    return nameData.toString();
  }

  void addToCart(String name, String image, double price) async {
    final cartService = CartService();
    List<CartItems> currentCart = await cartService.loadCart();

    final existing = currentCart.where((item) => item.name == name).toList();

    if (existing.isNotEmpty) {
      existing[0].quantity++;
    } else {
      currentCart.add(
        CartItems(name: name, image: image, price: price, quantity: 1),
      );
    }

    await cartService.saveCart(currentCart);
    setState(() => cartItems = currentCart);
  }

  @override
  void initState() {
    super.initState();
    PreferencesService.saveNavigationIndex(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBarr(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);
          if (index == 0) Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
          if (index == 1) Navigator.push(context, MaterialPageRoute(builder: (_) => Orders()));
          if (index == 2) Navigator.push(context, MaterialPageRoute(builder: (_) => Fruits()));
          if (index == 3) Navigator.push(context, MaterialPageRoute(builder: (_) => Profile()));
        },
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
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
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value.toLowerCase();
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        border: InputBorder.none,
                        hintText: S.of(context).search,
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color(0xff909090),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Image.asset(
                            'assets/images/search_icon.jpg',
                            width: 25,
                            height: 25,
                            fit: BoxFit.contain,
                            color: const Color(0xff909090),
                          ),
                        ),
                        prefixIconConstraints:
                        const BoxConstraints(minWidth: 40, minHeight: 40),
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 110,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xffFBFBFB),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      S.of(context).freshV,
                      style: GoogleFonts.poppins(
                        fontSize: 21,
                        color: const Color(0xff95C6AA),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('products')
                        .where('category', isEqualTo: 'fruits')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Padding(
                          padding: EdgeInsets.all(40),
                          child: CircularProgressIndicator(),
                        );
                      }

                      final products = snapshot.data!.docs;

                      final filteredProducts = products.where((product) {
                        final nameData = product['name'];
                        String productName = getProductName(nameData);
                        return productName.toLowerCase().contains(searchQuery);
                      }).toList();

                      if (filteredProducts.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(40),
                          child: Text(
                            S.of(context).searchResult,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: filteredProducts.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1.05,
                        ),
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          final productName = getProductName(product['name']);

                          return StreamBuilder<bool>(
                            stream: _favoritesService.isFavorite(product.id),
                            builder: (context, favSnapshot) {
                              final isFavorite = favSnapshot.data ?? false;

                              return VegetableCard(
                                name: productName,
                                price: product['price'].toDouble(),
                                image: product['image'],
                                isFavorite: isFavorite,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => Product(
                                        name: productName,
                                        price: product['price'].toDouble(),
                                        image: product['image'],
                                        isFavorite: isFavorite,
                                        category: 'fruits',
                                      ),
                                    ),
                                  );
                                },
                                onFavoriteTap: () {
                                  _favoritesService.toggleFavorite(
                                    productId: product.id,
                                    isFavorite: isFavorite,
                                    productData: {
                                      'name': product['name'],
                                      'price': product['price'],
                                      'image': product['image'],
                                      'category': product['category'],
                                    },
                                  );
                                },
                                onAddToCart: () {
                                  addToCart(
                                    productName,
                                    product['image'],
                                    product['price'].toDouble(),
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),

            Positioned(
              top: 6,
              left: 20,
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Home())),
                child: BackButton(),
              ),
            ),
            Positioned(
              top: 6,
              right: 20,
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Cart())),
                child: CartButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}