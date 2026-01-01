import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../main.dart';
import '../providers/auth_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'location.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  String? name;
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

          const SizedBox(height: 5),
          Text(
            S.of(context).SignUp,
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: const Color(0xff95C6AA),
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),
          Text(
            S.of(context).create,
            style: GoogleFonts.poppins(fontSize: 16),
          ),

          const SizedBox(height: 10),

          _label(context, S.of(context).Name),
          CustomTextfield(
            onChanged: (data) => name = data,
            hintText: S.of(context).enterName,
          ),

          const SizedBox(height: 3),

          _label(context, S.of(context).Email),
          CustomTextfield(
            onChanged: (data) => email = data,
            hintText: S.of(context).enterEmail,
          ),

          const SizedBox(height: 3),

          _label(context, S.of(context).Password),
          CustomTextfield(
            onChanged: (data) => password = data,
            hintText: S.of(context).enterPassword,
            obscureText: !isPasswordVisible,
            suffixIcon: IconButton(
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

          const SizedBox(height: 1),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                activeColor: const Color(0xff95C6AA),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Text(S.of(context).Terms),
            ],
          ),

          const SizedBox(height: 30),

          CustomButton(
            Btext: S.of(context).SignUp,
            onTap: () async {
              try {
                if (name == null || email == null || password == null ||
                    name!.isEmpty || email!.isEmpty || password!.isEmpty) {
                  _showMessage(context, "Please enter all required fields");
                  return;
                }

                if (password!.length < 6) {
                  _showMessage(context, "Password must be at least 6 characters");
                  return;
                }

                await authProvider.signUp(
                  name!.trim(),
                  email!.trim(),
                  password!.trim(),
                );

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Location()),);

              } catch (e) {
                _showMessage(context, e.toString());
              }
            },
          ),


          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).already),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()),);
                },
                child: Text(
                  S.of(context).LogIn,
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

          const SizedBox(height: 40),

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
                child: Image.asset(
                  'assets/images/google_icon.png',
                  height: 25,
                  width: 25,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 25),
              GestureDetector(
                onTap: (){},
                child: Image.asset(
                  'assets/images/apple_icon.png',
                  height: 25,
                  width: 25,
                ),
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

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}