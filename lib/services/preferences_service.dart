import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _languageKey = 'language';
  static const String _themeKey = 'theme';
  static const String _currentRouteKey = 'current_route';
  static const String _navigationIndexKey = 'navigation_index';

  // حفظ اللغة
  static Future<void> saveLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  // قراءة اللغة
  static Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey);
  }

  // حفظ الثيم
  static Future<void> saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, theme);
  }

  // قراءة الثيم
  static Future<String?> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey);
  }

  // حفظ الصفحة الحالية
  static Future<void> saveCurrentRoute(String route) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentRouteKey, route);
  }

  // قراءة الصفحة الحالية
  static Future<String?> getCurrentRoute() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_currentRouteKey);
  }

  // حفظ مؤشر الـ Navigation Bar
  static Future<void> saveNavigationIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_navigationIndexKey, index);
  }

  // قراءة مؤشر الـ Navigation Bar
  static Future<int> getNavigationIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_navigationIndexKey) ?? 0;
  }

  // مسح جميع التفضيلات (عند تسجيل الخروج مثلاً)
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentRouteKey);
    await prefs.remove(_navigationIndexKey);
    // لا نمسح اللغة والثيم لأنهما يبقيان حتى بعد تسجيل الخروج
  }
}