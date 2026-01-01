import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.enabled = true,
  });

  final String? hintText;
  final Function(String)? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xffEFEFEF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        enabled: enabled,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Color(0xff909090),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
