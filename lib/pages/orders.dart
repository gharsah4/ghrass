import 'package:flutter/material.dart' hide BackButton;
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled33333333/pages/profile.dart';
import '../generated/l10n.dart';
import '../services/preferences_service.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/cart_button.dart';
import '../widgets/back_button.dart';
import '../models/order_model.dart';
import '../services/orders_service.dart';
import '../providers/orders_provider.dart';
import 'fruits.dart';
import 'home.dart';
import 'cart.dart';
import 'checkout.dart';

class Orders extends StatefulWidget {
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int selectedIndex = 1;
  bool showCurrentOrders = true;

  final OrdersProvider provider = OrdersProvider();

  @override
  void initState() {
    super.initState();
    PreferencesService.saveNavigationIndex(7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () =>
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Home())),
                    child: BackButton(),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Cart())),
                    child: CartButton(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _ordersTabs(),
            const SizedBox(height: 20),
            Expanded(
              child: _ordersList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ordersTabs() {
    return Container(
      width: 372,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xffD7EBDD),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _tabButton(S.of(context).previousO, !showCurrentOrders),
          _tabButton(S.of(context).currentO, showCurrentOrders),
        ],
      ),
    );
  }

  Widget _tabButton(String text, bool isActive) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            showCurrentOrders = text == S.of(context).currentO;
            // تحديث الـ provider عند تغيير التاب
            provider.toggle(showCurrentOrders);
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xff95C6AA) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.white : Color(0xff515151),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ordersList() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Center(child: Text('يرجى تسجيل الدخول', style: GoogleFonts.poppins(fontSize: 18)));
    }

    return StreamBuilder<List<OrderModel>>(
      stream: provider.ordersStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              S.of(context).noOrders,
              style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        final orders = snapshot.data!;
        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return _orderCard(order);
          },
        );
      },
    );
  }

  Widget _orderCard(OrderModel order) {
    final DateTime orderDate = order.date;

    // استخراج صورة أول منتج من items
    String firstImage = '';
    try {
      if (order.items.isNotEmpty && order.items[0]['image'] != null) {
        firstImage = order.items[0]['image'] as String;
      }
    } catch (e) {
      firstImage = '';
    }

    return Container(
      height: 135,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: firstImage.isNotEmpty
                ? Image.network(
              firstImage,
              width: 65,
              height: 65,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                // في حالة فشل تحميل الصورة
                return Image.asset(
                  'assets/images/vegetables.png',
                  width: 65,
                  height: 65,
                  fit: BoxFit.contain,
                );
              },
            )
                : Image.asset(
              'assets/images/vegetables.png',
              width: 65,
              height: 65,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#${order.id.substring(0, 6)}",
                style: GoogleFonts.poppins(
                  color: const Color(0xff515151),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "${orderDate.day}/${orderDate.month}/${orderDate.year}",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                order.status == 'current'
                    ? "Out for delivery"
                    : "Delivered",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Checkout()));
                },
                child: Container(
                  width: 80,
                  height: 29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(23, 98, 56, 1),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    S.of(context).track,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            "SR ${order.total}",
            style: GoogleFonts.poppins(
              color: const Color(0xff515151),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}