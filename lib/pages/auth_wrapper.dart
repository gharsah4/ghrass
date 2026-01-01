import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled33333333/pages/cart.dart';
import 'package:untitled33333333/pages/checkout.dart';
import 'package:untitled33333333/pages/customer_profile.dart';
import 'package:untitled33333333/pages/favorites.dart';
import 'package:untitled33333333/pages/location.dart';
import 'package:untitled33333333/pages/product.dart';
import 'package:untitled33333333/pages/settings_page.dart';
import 'package:untitled33333333/pages/vegetables.dart';
import '../services/preferences_service.dart';
import 'login.dart';
import 'home.dart';
import 'orders.dart';
import 'fruits.dart';
import 'profile.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          return FutureBuilder<int>(
            future: PreferencesService.getNavigationIndex(),
            builder: (context, indexSnapshot) {
              if (indexSnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }

              final int savedIndex = indexSnapshot.data ?? 0;
              return _getPageByIndex(savedIndex);
            },
          );
        }

        return LogIn();
      },
    );
  }

  Widget _getPageByIndex(int index) {
    switch (index) {
      case 0:
        return Home();
      case 1:
        return Vegetables();
      case 2:
        return Fruits();
      case 3:
        return Product(name: 'name', image: 'image', price: 0.0, category: 'category');
      case 4:
        return Cart();
      case 5:
        return Favorites();
      case 6:
        return Checkout();
      case 7:
        return Orders();
      case 8:
        return Profile();
      case 9:
        return CustomerProfile();
      case 10:
        return SettingsPage();
      case 11:
        return Location();
      default:
        return Home();
    }
  }
}
