import 'package:flutter/material.dart' hide BackButton;
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled33333333/pages/welcome.dart';
import '../generated/l10n.dart';
import '../services/preferences_service.dart';
import '../widgets/back_button.dart' show BackButton;
import '../widgets/custom_textfield.dart';
import '../widgets/navigation_bar.dart';
import '../providers/auth_provider.dart';
import '../services/location_service.dart';
import 'home.dart';
import 'orders.dart';
import 'fruits.dart';
import 'profile.dart';

class CustomerProfile extends StatefulWidget {
  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  int selectedIndex = 3;
  String? selectedLocationId;
  List<Map<String, dynamic>> locations = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  String? initialName;
  String? initialEmail;
  String? initialLocationId;

  @override
  void initState() {
    super.initState();
    PreferencesService.saveNavigationIndex(3);

    final auth = context.read<AuthProvider>();
    auth.loadUserData().then((_) {
      setState(() {
        initialName = auth.userData?['name'] ?? '';
        initialEmail = auth.userData?['email'] ?? '';
        initialLocationId = auth.userData?['locationId'];

        nameController.text = initialName ?? '';
        selectedLocationId = initialLocationId;
      });
    });

    fetchLocations();
  }

  Future<void> fetchLocations() async {
    locations = await LocationService.getLocations();
    if (selectedLocationId == null && locations.isNotEmpty) {
      selectedLocationId = locations[0]['id'];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

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
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Profile()));
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
                  S.of(context).myProfile,
                  style: GoogleFonts.poppins(
                    fontSize: 21,
                    color: const Color(0xff515151),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // الاسم
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Text(
                  S.of(context).Name,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xff515151),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomTextfield(controller: nameController, hintText: initialName),
              // الايميل (ثابت)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Text(
                  S.of(context).Email,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xff515151),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomTextfield(
                hintText: initialEmail,
                enabled: false,
              ),
              // كلمة المرور مع ايقونة العين
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Text(
                  S.of(context).changePassword,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xff515151),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CustomTextfield(
                controller: passwordController,
                obscureText: obscurePassword,
                hintText: '********',
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xff909090),
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
              ),

              // اختيار الموقع
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Text(
                  S.of(context).changeLocation,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xff515151),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedLocationId,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 35,
                      color: Color(0xff909090),
                    ),
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: const Color(0xff909090),
                      fontWeight: FontWeight.bold,
                    ),
                    items: locations.map((loc) {
                      return DropdownMenuItem<String>(
                        value: loc['id'],
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 30,
                              color: Color(0xff909090),
                            ),
                            const SizedBox(width: 10),
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

              const SizedBox(height: 100),

              // زر التحديث
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff176238),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      if (nameController.text.isNotEmpty) {
                        await auth.updateName(nameController.text);
                      }
                      if (passwordController.text.isNotEmpty) {
                        await auth.updatePassword(passwordController.text);
                      }
                      /*if (selectedLocationId != null) {
                        await auth.updateLocation(selectedLocationId!);
                      }*/

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(S.of(context).update)),
                      );
                    },
                    child: Text(
                      S.of(context).update,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // زر تسجيل الخروج
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 4,
                      backgroundColor: const Color(0xff868686),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      // عرض dialog للتأكيد
                      final bool? confirmLogout = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              S.of(context).LogOut,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              S.of(context).ausLogout,
                              style: GoogleFonts.poppins(),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                child: Text(
                                  S.of(context).cancel,
                                  style: GoogleFonts.poppins(color: Colors.grey),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                child: Text(
                                  S.of(context).LogOut,
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xff176238),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );

                      // إذا أكد المستخدم تسجيل الخروج
                      if (confirmLogout == true) {
                        // مسح جميع بيانات التنقل المحفوظة (مع الاحتفاظ باللغة والثيم)
                        await PreferencesService.clearAll();

                        // تسجيل الخروج من Firebase
                        await auth.logOut();

                        // الانتقال إلى صفحة الترحيب ومسح جميع الصفحات السابقة
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Welcome()),
                              (route) => false,
                        );
                      }
                    },
                    child: Text(
                      S.of(context).LogOut,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: const Color(0xffFBFBFB),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
    passwordController.dispose();
    super.dispose();
  }
}