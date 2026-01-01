import 'package:flutter/material.dart' hide BackButton;
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled33333333/pages/profile.dart';
import '../pages/cart.dart';
import '../pages/ty_message.dart';
import '../services/preferences_service.dart';
import '../widgets/cart_item.dart';
import '../widgets/custom_button.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/back_button.dart';
import '../generated/l10n.dart';
import '../services/location_service.dart';
import '../services/orders_service.dart';
import '../services/cart_service.dart';
import 'home.dart';
import 'orders.dart';
import 'fruits.dart';

class Checkout extends StatefulWidget {
  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int selectedIndex = 3;
  String? selectedLocationId;
  String selectedValueT = 'Home';
  double deliveryFee = 15.0;
  List<CartItems> cartItems = [];

  @override
  void initState() {
    super.initState();
    fetchLocations();
    loadCart();
    PreferencesService.saveNavigationIndex(6);
  }

  Future<void> loadCart() async {
    cartItems = await CartService().loadCart();
    setState(() {});
  }

  List<Map<String, dynamic>> locations = [];

  Future<void> fetchLocations() async {
    locations = await LocationService.getLocations();
    if (locations.isNotEmpty) {
      selectedLocationId = locations[0]['id'];
    }
    setState(() {});
  }

  double get cartTotal =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  double get grandTotal => cartTotal + deliveryFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(255, 255, 255, 100),
      body: Stack(
        children: [
          Positioned(
            top: 130,
            left: 25,
            child: Text(
              S.of(context).selectAddress,
              style: GoogleFonts.poppins(
                fontSize: 21,
                color: Color(0xff95C6AA),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 165,
            left: 15,
            child: Column(
              children: [
                Container(
                  width: 395,
                  height: 65,
                  margin: const EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 16),
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
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedLocationId,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 35,
                        color: Color(0xff909090),
                      ),
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Color(0xff909090),
                          fontWeight: FontWeight.bold),
                      items: locations.map((loc) {
                        return DropdownMenuItem<String>(
                          value: loc['id'],
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 30,
                                color: Color(0xff909090),
                              ),
                              SizedBox(width: 10),
                              Text(loc['name']),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedLocationId = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  width: 395,
                  height: 65,
                  margin: const EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 16),
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
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedValueT,
                      isExpanded: true,
                      icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 35,
                          color: Color(0xff909090)),
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Color(0xff909090),
                          fontWeight: FontWeight.bold),
                      items: const [
                        DropdownMenuItem(
                          value: 'Home',
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: 30,
                                color: Color(0xff909090),
                              ),
                              SizedBox(width: 10),
                              Text('12:00 PM'),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Work',
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: 30,
                                color: Color(0xff909090),
                              ),
                              SizedBox(width: 10),
                              Text('12:30 PM'),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Home2',
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: 30,
                                color: Color(0xff909090),
                              ),
                              SizedBox(width: 10),
                              Text('1:00 PM'),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Work2',
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: 30,
                                color: Color(0xff909090),
                              ),
                              SizedBox(width: 10),
                              Text('1:30 PM'),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedValueT = value!;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 268,
            left: 25,
            child: Text(
              (S.of(context).selectTime),
              style: GoogleFonts.poppins(
                fontSize: 21,
                color: Color(0xff95C6AA),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 404,
            left: 25,
            child: Text(
              (S.of(context).selectPayment),
              style: GoogleFonts.poppins(
                fontSize: 21,
                color: Color(0xff95C6AA),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 437,
            left: 15,
            child: Row(
              children: [
                Container(
                  width: 112,
                  height: 77,
                  margin: const EdgeInsets.all(10),
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
                  child: Align(
                    alignment: Alignment(0.1, 0.1),
                    child: Image.asset(
                      'assets/images/cash.png',
                      width: 60,
                      height: 60,
                      color: Colors.black,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 112,
                  height: 77,
                  margin: const EdgeInsets.all(10),
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
                  child: Align(
                    alignment: Alignment(0.1, 0.1),
                    child: Image.asset(
                      'assets/images/stc_pay.png',
                      width: 85,
                      height: 85,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 112,
                  height: 77,
                  margin: const EdgeInsets.all(10),
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
                  child: Align(
                    alignment: Alignment(0.1, 0.1),
                    child: Image.asset(
                      'assets/images/apple_pay.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 550,
            left: 25,
            child: Text(
              (S.of(context).voucherCode),
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Color(0xff515151),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Positioned(
            bottom: 335,
            left: 15,
            child: Container(
              height: 50,
              width: 390,
              margin: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 15, vertical: 15),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 275,
            left: 33,
            child: Row(
              children: [
                Text(
                  (S.of(context).cartTotal),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 232),
                Text(
                  'SR ${cartTotal.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Color(0xff909090),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 245,
            left: 33,
            child: Row(
              children: [
                Text(
                  (S.of(context).deliveryFees),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 205),
                Text(
                  'SR ${deliveryFee.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Color(0xff909090),
                  ),
                ),

              ],
            ),
          ),
          Positioned(
            bottom: 230,
            left: 25,
            child: Container(
              height: 1.5,
              width: 395,
              color: Color(0xffC4C4C4),
            ),
          ),
          Positioned(
            bottom: 198,
            left: 33,
            child: Row(
              children: [
                Text(
                  (S.of(context).total),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 270),
                Text(
                  'SR ${grandTotal.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 110,
            left: 39,
            child: CustomButton(
              Btext: "${S.of(context).pay} SR ${grandTotal.toStringAsFixed(2)}",
              onTap: () async {
                try {
                  // إنشاء الطلب والحصول على orderId
                  final orderId = await OrdersService().createOrder(
                    items: cartItems.map((e) => e.toJson()).toList(),
                    total: grandTotal,
                  );

                  // حذف السلة بعد إتمام الطلب بنجاح
                  await CartService().clearCart();

                  // الانتقال لصفحة الشكر مع تمرير orderId
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TyMessage(orderId: orderId),
                    ),
                  );
                } catch (e) {
                  print('ERROR: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('حدث خطأ في معالجة الطلب'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ),
          NavigationBarr(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });

              if (index == 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              } else if (index == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Orders()));
              } else if (index == 2) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Fruits()));
              } else if (index == 3) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
              }
            },
          ),
          Positioned(
            top: 55,
            left: 20,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Cart();
                },),);
              },
              child: BackButton(),
            ),
          ),
        ],
      ),
    );
  }
}