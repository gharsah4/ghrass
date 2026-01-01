import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../main.dart';
import '../providers/auth_provider.dart';
import '../widgets/custom_button.dart';
import 'home.dart';
import 'signup.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isChecked = false;
  String? email;
  String? password;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 100),
      body: Column(
        children: [
          const SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'AR',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Localizations.localeOf(context).languageCode == 'ar'
                        ? const Color(0xff95C6AA)
                        : Colors.grey,
                  ),
                ),
                Switch(
                  activeColor: const Color(0xff95C6AA),
                  value:
                  Localizations.localeOf(context).languageCode == 'en',
                  onChanged: (value) {
                    GherasApp.of(context)?.changeLanguage(
                      value
                          ? const Locale('en')
                          : const Locale('ar'),
                    );
                  },
                ),
                Text(
                  'EN',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Localizations.localeOf(context).languageCode == 'en'
                        ? const Color(0xff95C6AA)
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Text(
              S.of(context).title,
              style: GoogleFonts.italianno(
                fontSize: 120,
                shadows: const [
                  Shadow(
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),
          Text(
            S.of(context).LogIn,
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: const Color(0xff95C6AA),
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),
          Text(
            S.of(context).LogInTo,
            style: GoogleFonts.poppins(fontSize: 16),
          ),

          const SizedBox(height: 20),

          _label(context, S.of(context).Email),
          _inputField(
            onChanged: (v) => email = v,
            hint: S.of(context).enterEmail,
          ),

          _label(context, S.of(context).Password),
          _inputField(
            onChanged: (v) => password = v,
            hint: S.of(context).enterPassword,
            obscure: !isPasswordVisible,
            suffix: IconButton(
              icon: Icon(
                isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: const Color(0xff909090),
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
          ),

          Row(
            children: [
              Checkbox(
                activeColor: const Color(0xff95C6AA),
                value: isChecked,
                onChanged: (v) {
                  setState(() {
                    isChecked = v!;
                  });
                },
              ),
              Text(S.of(context).Remember),
              const SizedBox(width: 165),
              Text(
                S.of(context).Forget,
                style: GoogleFonts.poppins(fontSize: 13),
              ),
            ],
          ),

          const SizedBox(height: 90),

          CustomButton(
            Btext: S.of(context).LogIn,
            onTap: () async {
              try {
                if (email == null || password == null ||
                    email!.isEmpty || password!.isEmpty) {
                  _showMessage(context, "Please enter email and password");
                  return;
                }

                await authProvider.logIn(
                  email!.trim(),
                  password!.trim(),
                );

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()),);

              } catch (e) {
                _showMessage(context, e.toString());
              }
            },
          ),


          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).CreateN,
                style: GoogleFonts.poppins(fontSize: 13),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const SignUp()),
                  );
                },
                child: Text(
                  S.of(context).SignUp,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color:
                    const Color.fromRGBO(23, 98, 56, 50),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 2,
                width: 130,
                color: const Color(0xff5F605F),
              ),
              Text(S.of(context).continuee),
              Container(
                height: 2,
                width: 130,
                color: const Color(0xff5F605F),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){},
                child: Image.asset('assets/images/google_icon.png',
                    height: 25, width: 25, fit: BoxFit.contain),
              ),
              const SizedBox(width: 25),
              GestureDetector(
                onTap: (){},
                child: Image.asset('assets/images/apple_icon.png',
                    height: 25, width: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _label(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xff909090),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _inputField({
    required Function(String) onChanged,
    required String hint,
    bool obscure = false,
    Widget? suffix,
  }) {
    return Container(
      margin: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xffEFEFEF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        obscureText: obscure,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color(0xff909090),
          ),
          suffixIcon: suffix,
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }
}