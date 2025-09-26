import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';

class HeaderSection extends StatelessWidget {
  final void Function(Locale) onLocaleChange;
  final void Function(String section) onNavButtonPressed;

  const HeaderSection({
    super.key,
    required this.onLocaleChange,
    required this.onNavButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            loc.headerTitle,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00AEEF),
            ),
          ),
          Row(
            children: [
              _navButton(loc.aboutTitle, 'about'),
              _navButton(loc.services, 'services'),
              _navButton(loc.contact, 'contact'),
              _languageSelector(context, loc),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navButton(String text, String sectionKey) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () => onNavButtonPressed(sectionKey),
        child: Text(text, style: const TextStyle(color: Colors.black87)),
      ),
    );
  }

  Widget _languageSelector(BuildContext context, AppLocalizations loc) {
    final locale = Localizations.localeOf(context);

    String flag;
    switch (locale.languageCode) {
      case 'en':
        flag = 'assets/flags/us.png';
        break;
      case 'es':
        flag = 'assets/flags/es.png';
        break;
      case 'it':
        flag = 'assets/flags/it.png';
        break;
      default:
        flag = 'assets/flags/es.png';
    }

    return PopupMenuButton<Locale>(
      icon: Image.asset(flag, width: 24, height: 24),
      onSelected: onLocaleChange,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: const Locale('es'),
          child: Text(loc.languageSpanish),
        ),
        PopupMenuItem(
          value: const Locale('en'),
          child: Text(loc.languageEnglish),
        ),
        PopupMenuItem(
          value: const Locale('it'),
          child: Text(loc.languageItalian),
        ),
      ],
    );
  }
}
