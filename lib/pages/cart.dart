import 'package:flutter/material.dart' hide BackButton;
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled33333333/pages/favorites.dart';
import 'package:untitled33333333/pages/profile.dart';
import '../generated/l10n.dart';
import '../services/preferences_service.dart';
import '../widgets/back_button.dart' show BackButton;
import '../widgets/custom_button.dart';
import '../widgets/fav_button.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/cart_item.dart';
import 'checkout.dart';
import 'home.dart';
import 'orders.dart';
import 'fruits.dart';
import '../services/cart_service.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int selectedIndex = 1;
  List<CartItems> cartItems = [];

  @override
  void initState() {
    super.initState();
    loadCart();
    PreferencesService.saveNavigationIndex(4);
  }

  void loadCart() async {
    cartItems = await CartService().loadCart();
    setState(() {});
  }

  double get cartTotal =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  void updateCart() async {
    await CartService().saveCart(cartItems);
    setState(() {});
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Favorites()),);
                    },
                    child: FavButton(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).cart,
              style: GoogleFonts.poppins(
                fontSize: 21,
                color: const Color(0xff95C6AA),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: cartItems.isEmpty
                  ? Center(
                child: Text(
                  S.of(context).cartEmpty,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              )
                  : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(10),
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
                          child: Row(
                            children: [
                              Image.network(
                                item.image,
                                width: 90,
                                height: 90,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 10),

                              /// Product Info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "${item.quantity} Kilo",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff909090),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "SR ${(item.price * item.quantity).toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff515151),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// Quantity Controls
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove,
                                        color: Color(0xff909090)),
                                    onPressed: () {
                                      setState(() {
                                        if (item.quantity > 1) {
                                          item.quantity--;
                                        } else {
                                          cartItems.removeAt(index);
                                        }
                                        updateCart();
                                      });
                                    },
                                  ),
                                  Text(
                                    item.quantity.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add,
                                        color: Color(0xff118844)),
                                    onPressed: () {
                                      setState(() {
                                        item.quantity++;
                                        updateCart();
                                      });
                                    },
                                  ),
                                ],
                              ),

                              /// Delete
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    cartItems.removeAt(index);
                                    updateCart();
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    /// ===== Total =====
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).total,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'SR ${cartTotal.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    CustomButton(
                      Btext: S.of(context).checkout,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Checkout()),
                        );
                      },
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      /// ===== Bottom Nav =====
      bottomNavigationBar: NavigationBarr(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);

          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => Home()));
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => Orders()));
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => Fruits()));
          } else if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => Profile()));
          }
        },
      ),
    );
  }
}
