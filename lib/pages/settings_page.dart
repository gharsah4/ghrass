import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled33333333/pages/profile.dart';
import '../generated/l10n.dart';
import '../main.dart';
import '../services/preferences_service.dart';
import '../utils/theme_helper.dart';
import '../widgets/back_button.dart' show BackButton;
import '../widgets/navigation_bar.dart';
import 'home.dart';
import 'orders.dart';
import 'fruits.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int selectedIndex = 3;
  bool _notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
    PreferencesService.saveNavigationIndex(3);
    _loadNotificationSetting();
  }

  Future<void> _loadNotificationSetting() async {
    // يمكنك تحميل حالة الإشعارات من SharedPreferences
    // bool? saved = await PreferencesService.getNotifications();
    // setState(() => _notificationsEnabled = saved ?? false);
  }

  void _changeLanguage(String? langCode) {
    if (langCode != null) {
      Locale newLocale = Locale(langCode);
      GherasApp.of(context)?.changeLanguage(newLocale);
    }
  }

  void _changeTheme(String? themeCode) {
    if (themeCode != null) {
      ThemeMode newTheme = themeCode == 'dark' ? ThemeMode.dark : ThemeMode.light;
      GherasApp.of(context)?.changeTheme(newTheme);
    }
  }

  String _getCurrentTheme() {
    return Theme.of(context).brightness == Brightness.dark ? 'dark' : 'light';
  }

  final List<Map<String, String>> languages = [
    {'code': 'ar', 'name': 'العربية', 'flag': '🇸🇦'},
    {'code': 'en', 'name': 'English', 'flag': '🇺🇸'},
  ];

  final List<Map<String, String>> themes = [
    {'code': 'light', 'nameAr': 'فاتح', 'nameEn': 'Light', 'icon': '☀️'},
    {'code': 'dark', 'nameAr': 'داكن', 'nameEn': 'Dark', 'icon': '🌙'},
  ];

  @override
  Widget build(BuildContext context) {
    String currentLanguage = Localizations.localeOf(context).languageCode;
    String currentTheme = _getCurrentTheme();
    bool isDark = ThemeHelper.isDark(context);

    return Scaffold(
      backgroundColor: ThemeHelper.getBackgroundColor(context),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Profile()),
                      );
                    },
                    child: BackButton(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  S.of(context).settings,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    fontSize: 21,
                    color: ThemeHelper.getTextColor(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).notification,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ThemeHelper.getTextColor(context),
                    ),
                  ),
                  CupertinoSwitch(
                    value: _notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                      // حفظ حالة الإشعارات
                      // PreferencesService.saveNotifications(value);
                    },
                    activeColor: const Color(0xff176238),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentLanguage == 'ar' ? 'اللغة' : 'Language',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ThemeHelper.getTextColor(context),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 70,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: ThemeHelper.getCardColor(context),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: ThemeHelper.getShadowColor(context),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: currentLanguage,
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: ThemeHelper.getIconColor(context),
                        ),
                        iconSize: 28,
                        elevation: 16,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ThemeHelper.getTextColor(context),
                        ),
                        dropdownColor: ThemeHelper.getCardColor(context),
                        borderRadius: BorderRadius.circular(12),
                        onChanged: _changeLanguage,
                        items: languages.map((language) {
                          return DropdownMenuItem<String>(
                            value: language['code'],
                            child: Row(
                              children: [
                                Text(
                                  language['flag']!,
                                  style: const TextStyle(fontSize: 24),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  language['name']!,
                                  style: GoogleFonts.poppins(
                                    color: ThemeHelper.getTextColor(context),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentLanguage == 'ar' ? 'المظهر' : 'Appearance',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ThemeHelper.getTextColor(context),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 70,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: ThemeHelper.getCardColor(context),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: ThemeHelper.getShadowColor(context),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: currentTheme,
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: ThemeHelper.getIconColor(context),
                        ),
                        iconSize: 28,
                        elevation: 16,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ThemeHelper.getTextColor(context),
                        ),
                        dropdownColor: ThemeHelper.getCardColor(context),
                        borderRadius: BorderRadius.circular(12),
                        onChanged: _changeTheme,
                        items: themes.map((theme) {
                          return DropdownMenuItem<String>(
                            value: theme['code'],
                            child: Row(
                              children: [
                                Text(
                                  theme['icon']!,
                                  style: const TextStyle(fontSize: 24),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  currentLanguage == 'ar'
                                      ? theme['nameAr']!
                                      : theme['nameEn']!,
                                  style: GoogleFonts.poppins(
                                    color: ThemeHelper.getTextColor(context),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 270),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff868686),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    final bool? confirm = await showDialog<bool>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: ThemeHelper.getCardColor(context),
                          title: Text(
                            S.of(context).deleteAccount,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: ThemeHelper.getTextColor(context),
                            ),
                          ),
                          content: Text(
                            'هل أنت متأكد من حذف الحساب؟ هذا الإجراء لا يمكن التراجع عنه.',
                            style: GoogleFonts.poppins(
                              color: ThemeHelper.getSecondaryTextColor(context),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text(
                                'إلغاء',
                                style: GoogleFonts.poppins(color: Colors.grey),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: Text(
                                'حذف',
                                style: GoogleFonts.poppins(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );

                    if (confirm == true) {
                      // هنا ضع كود حذف الحساب
                      // await AuthProvider.deleteAccount();
                    }
                  },
                  child: Text(
                    S.of(context).deleteAccount,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBarr(
        currentIndex: selectedIndex,
        onTap: (index) async {
          setState(() => selectedIndex = index);
          await PreferencesService.saveNavigationIndex(index);

          if (index == 0) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()),);
          } else if (index == 1) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Orders()),);
          } else if (index == 2) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Fruits()),);
          } else if (index == 3) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Profile()),);
          }
        },
      ),
    );
  }
}