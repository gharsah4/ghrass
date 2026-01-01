import 'package:flutter/material.dart';

class ThemeHelper {
  // الحصول على لون الخلفية حسب الثيم
  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xff1a1a1a)
        : Colors.white;
  }

  // الحصول على لون الكارد حسب الثيم
  static Color getCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xff2a2a2a)
        : Colors.white;
  }

  // الحصول على لون النص الأساسي
  static Color getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : const Color(0xff515151);
  }

  // الحصول على لون النص الثانوي
  static Color getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white70
        : Colors.grey;
  }

  // الحصول على لون الأيقونات
  static Color getIconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.white70
        : const Color(0xff909090);
  }

  // الحصول على لون الظل
  static Color getShadowColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black.withOpacity(0.3)
        : Colors.grey.shade300;
  }

  // الحصول على لون الحقول
  static Color getFieldColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? const Color(0xff2a2a2a)
        : const Color(0xffFBFBFB);
  }

  // التحقق إذا كان الثيم داكن
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}