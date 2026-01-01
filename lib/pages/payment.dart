import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide BackButton;
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled33333333/pages/profile.dart';
import '../services/preferences_service.dart';
import '../utils/theme_helper.dart';
import '../widgets/back_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';
import '../generated/l10n.dart';
import '../widgets/navigation_bar.dart';
import 'fruits.dart';
import 'home.dart';
import 'orders.dart';

class Payment extends StatefulWidget {
  final double? totalAmount;

  const Payment({Key? key, this.totalAmount}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String selectedPayment = 'card';
  int selectedIndex = 3;
  bool _saveCard = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // زر الرجوع
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Profile()),);
                      },
                      child: BackButton(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              // عنوان الصفحة
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Text(
                  S.of(context).information,
                  style: GoogleFonts.poppins(
                    fontSize: 21,
                    color: const Color(0xff95C6AA),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Text(
                  S.of(context).nameInCard,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xff515151),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomTextfield(
                controller: nameController,
                hintText: '',
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Text(
                  S.of(context).cardNumber,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xff515151),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomTextfield(
                controller: cardNumberController,
                hintText: '',
              ),
              // تاريخ الانتهاء و CVV
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Text(
                  S.of(context).expiryDate,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xff515151),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextfield(
                      controller: expiryController,
                      hintText: 'MM/YY',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 10),
                          child: Text(
                            S.of(context).securityCode,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xff515151),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CustomTextfield(
                          controller: cvvController,
                          hintText: 'CVV',
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // طرق الدفع
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Text(
                  S.of(context).paymentMethod,
                  style: GoogleFonts.poppins(
                    fontSize: 21,
                    color: const Color(0xff95C6AA),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPayment = 'card';
                          });
                        },
                        child: Container(
                          height: 77,
                          decoration: BoxDecoration(
                            color: const Color(0xffFBFBFB),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: selectedPayment == 'card'
                                  ? const Color(0xff95C6AA)
                                  : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                spreadRadius: 1,
                                offset: Offset(0, 1.5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/mastercard.png',
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPayment = 'stc';
                          });
                        },
                        child: Container(
                          height: 77,
                          decoration: BoxDecoration(
                            color: const Color(0xffFBFBFB),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: selectedPayment == 'stc'
                                  ? const Color(0xff95C6AA)
                                  : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                spreadRadius: 1,
                                offset: Offset(0, 1.5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/stc_pay.png',
                              height: 30,
                              errorBuilder: (context, error, stackTrace) {
                                return Text(
                                  'stc pay',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xff4B0082),
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPayment = 'apple';
                          });
                        },
                        child: Container(
                          height: 77,
                          decoration: BoxDecoration(
                            color: const Color(0xffFBFBFB),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: selectedPayment == 'apple'
                                  ? const Color(0xff95C6AA)
                                  : Colors.transparent,
                              width: 2,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                spreadRadius: 1,
                                offset: Offset(0, 1.5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/apple_pay.png',
                              height: 35,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.apple,
                                  size: 40,
                                  color: Colors.black,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).saveCard,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ThemeHelper.getTextColor(context),
                      ),
                    ),
                    CupertinoSwitch(
                      value: _saveCard,
                      onChanged: (value) {
                        setState(() {
                          _saveCard = value;
                        });
                      },
                      activeColor: const Color(0xff176238),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              // زر التأكيد
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: CustomButton(
                    Btext: S.of(context).confirmP,
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarr(
        currentIndex: selectedIndex,
        onTap: (index) async {
          setState(() => selectedIndex = index);
          await PreferencesService.saveNavigationIndex(index);

          if (index == 0) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));
          } else if (index == 1) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Orders()));
          } else if (index == 2) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Fruits()));
          } else if (index == 3) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Profile()));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }
}