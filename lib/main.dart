import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/generated/app_localizations.dart';
import 'sections/header.dart';
import 'sections/hero.dart';
import 'sections/about.dart';
import 'sections/services.dart';
import 'sections/contact.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatefulWidget {
  const MyPortfolioApp({super.key});

  @override
  State<MyPortfolioApp> createState() => _MyPortfolioAppState();
}

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  Locale _locale = const Locale('es'); // Idioma por defecto

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio - J. Nahuel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF00AEEF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00AEEF),
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('it'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: PortfolioHomePage(
        onLocaleChange: setLocale,
      ),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  final void Function(Locale) onLocaleChange;

  const PortfolioHomePage({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderSection(
              onLocaleChange: onLocaleChange, // 🔹 Pasamos callback para cambiar idioma
            ),
            const HeroSection(),
            const AboutMeSection(),
            const ServicesSection(),
            const ContactSection(),
          ],
        ),
      ),
    );
  }
}
