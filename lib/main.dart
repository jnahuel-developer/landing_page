import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/generated/app_localizations.dart';
import 'sections/header.dart';
import 'sections/hero.dart';
import 'sections/about.dart';
import 'sections/services.dart';
import 'sections/contact.dart';
import 'package:flutter/services.dart';
import 'dart:async';

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
      title: 'Nahuel martinez',
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

class PortfolioHomePage extends StatefulWidget {
  final void Function(Locale) onLocaleChange;

  const PortfolioHomePage({super.key, required this.onLocaleChange});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}



class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  // 🔑 Keys para identificar cada sección
  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final servicesKey = GlobalKey();
  final contactKey = GlobalKey();

  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  void _startScrolling(bool down) {
    _scrollTimer?.cancel();
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      // 16ms ≈ 60fps
      final newOffset = _scrollController.offset + (down ? 50 : -50);
      _scrollController.jumpTo(
        newOffset.clamp(
          0.0,
          _scrollController.position.maxScrollExtent,
        ),
      );
    });
  }

  void _stopScrolling() {
    _scrollTimer?.cancel();
    _scrollTimer = null;
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        _startScrolling(true);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        _startScrolling(false);
      }
    } else if (event is RawKeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowDown ||
          event.logicalKey == LogicalKeyboardKey.arrowUp) {
        _stopScrolling();
      }
    }
  }

  // 🔧 función para scrollear a cada sección
  void scrollToSection(String section) {
    BuildContext? targetContext;
    switch (section) {
      case 'hero':
        targetContext = heroKey.currentContext;
        break;
      case 'about':
        targetContext = aboutKey.currentContext;
        break;
      case 'services':
        targetContext = servicesKey.currentContext;
        break;
      case 'contact':
        targetContext = contactKey.currentContext;
        break;
    }
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RawKeyboardListener(
        focusNode: _focusNode,
        onKey: _handleKeyEvent,
        child: Column(
          children: [
            // 🔝 Header fijo arriba con navegación
            HeaderSection(
              onLocaleChange: widget.onLocaleChange,
              onNavButtonPressed: scrollToSection,
            ),

            // ⬇️ El resto scrollea
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HeroSection(key: heroKey),
                    AboutMeSection(
                      key: aboutKey,
                      onLocaleChange: widget.onLocaleChange,
                    ),
                    ServicesSection(key: servicesKey),
                    ContactSection(key: contactKey),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
