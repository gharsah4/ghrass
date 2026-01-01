import 'package:flutter/material.dart' hide BackButton;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled33333333/pages/cart.dart';
import 'package:untitled33333333/pages/customer_profile.dart';
import 'package:untitled33333333/pages/favorites.dart';
import 'package:untitled33333333/pages/payment.dart';
import 'package:untitled33333333/pages/settings_page.dart';
import 'package:untitled33333333/widgets/cart_button.dart';
import 'package:untitled33333333/widgets/profile_card.dart';
import '../generated/l10n.dart';
import '../providers/auth_provider.dart';
import '../services/preferences_service.dart';
import '../widgets/back_button.dart' show BackButton;
import '../widgets/navigation_bar.dart';
import 'home.dart';
import 'orders.dart';
import 'fruits.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 3;

  @override
  void initState() {
    super.initState();
    PreferencesService.saveNavigationIndex(8);
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
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Consumer<AuthProvider>(
                  builder: (context, auth, _) {
                    if (auth.isLoading) {
                      return const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    }

                    return Text(
                      auth.userData?['name'] ?? 'User',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 21,
                        color: const Color(0xff515151),
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            ProfileCard(
                iconData: Icons.person_add_alt_1_rounded,
                title: S.of(context).inviteFriend,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
                }
            ),
            ProfileCard(
                iconData: Icons.person_rounded,
                title: S.of(context).myProfile,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CustomerProfile()));
                }
            ),
            ProfileCard(
                iconData: Icons.favorite_rounded,
                title: S.of(context).favorites,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Favorites()));
                }
            ),
            ProfileCard(
                iconData: Icons.payment_rounded,
                title: S.of(context).paymentMethod,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Payment()));
                }
            ),
            ProfileCard(
                iconData: Icons.headset_mic_rounded,
                title: S.of(context).customerService,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
                }
            ),
            ProfileCard(
                iconData: Icons.settings_rounded,
                title: S.of(context).settings,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsPage()));
                }
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
            Navigator.push(context, MaterialPageRoute(builder: (_) => Profile()));
          }
        },
      ),
    );
  }
}
