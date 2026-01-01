import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'pages/firebase_options.dart';
import 'pages/auth_wrapper.dart';
import 'providers/auth_provider.dart';
import 'services/preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: const GherasApp(),
    ),
  );
}

class GherasApp extends StatefulWidget {
  const GherasApp({super.key});

  static _GherasAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<_GherasAppState>();
  }

  @override
  State<GherasApp> createState() => _GherasAppState();
}

class _GherasAppState extends State<GherasApp> {
  Locale _locale = const Locale('ar');
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    String? savedLanguage = await PreferencesService.getLanguage();
    if (savedLanguage != null) {
      setState(() {
        _locale = Locale(savedLanguage);
      });
    }

    String? savedTheme = await PreferencesService.getTheme();
    if (savedTheme != null) {
      setState(() {
        _themeMode = savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
      });
    }
  }

  void changeLanguage(Locale locale) async {
    setState(() {
      _locale = locale;
    });
    await PreferencesService.saveLanguage(locale.languageCode);
  }

  void changeTheme(ThemeMode themeMode) async {
    setState(() {
      _themeMode = themeMode;
    });
    await PreferencesService.saveTheme(
      themeMode == ThemeMode.dark ? 'dark' : 'light',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gheras",
      locale: _locale,
      themeMode: _themeMode,

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: const Color(0xff176238),
        scaffoldBackgroundColor: Colors.white,

        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xff515151)),
          bodyMedium: TextStyle(color: Color(0xff515151)),
          titleLarge: TextStyle(color: Color(0xff515151)),
        ),

        iconTheme: const IconThemeData(
          color: Color(0xff515151),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xff515151),
          elevation: 0,
        ),

        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          shadowColor: Colors.grey.shade300,
        ),

        cardColor: Colors.white,

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff176238),
            foregroundColor: Colors.white,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xffFBFBFB),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),

        dividerColor: Colors.grey.shade300,
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: const Color(0xff176238),
        scaffoldBackgroundColor: const Color(0xff1a1a1a),

        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white),
        ),

        iconTheme: const IconThemeData(
          color: Colors.white70,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff1a1a1a),
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        cardTheme: const CardThemeData(
          color: Color(0xff2a2a2a),
          elevation: 2,
          shadowColor: Colors.black38,
        ),

        cardColor: const Color(0xff2a2a2a),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff176238),
            foregroundColor: Colors.white,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xff2a2a2a),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),

        dividerColor: Colors.white24,
      ),

      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: AuthWrapper(),
    );
  }
}