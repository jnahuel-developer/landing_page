import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';

class HeaderSectionMobile extends StatelessWidget {
  final void Function(Locale) onLocaleChange;
  final void Function(String section) onNavButtonPressed;

  const HeaderSectionMobile({
    super.key,
    required this.onLocaleChange,
    required this.onNavButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🔹 Espacio vacío para balancear con el menú de la derecha
          const SizedBox(width: 20),

          // 🔹 Título centrado
          Expanded(
            child: Center(
              child: Text(
                loc.headerTitle,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00AEEF),
                ),
              ),
            ),
          ),

          // 🔹 Selector de idioma
          _languageSelector(context, loc),
        ],
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
      icon: Image.asset(flag, width: 20, height: 20),
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
