import 'package:flutter/material.dart';
import 'package:portfolio/l10n/generated/l10n.dart';

class HeaderSection extends StatelessWidget {
  final void Function(Locale) onLocaleChange;

  const HeaderSection({super.key, required this.onLocaleChange});

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
              _navButton(loc.login),
              _navButton(loc.aboutTitle),
              _navButton(loc.services),
              _navButton(loc.contact),
              _languageSelector(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () {
          // TODO: implementar scroll a sección
        },
        child: Text(text, style: const TextStyle(color: Colors.black87)),
      ),
    );
  }

  Widget _languageSelector(BuildContext context) {
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language, color: Colors.black87),
      onSelected: onLocaleChange,
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: Locale('en'),
          child: Text("🇺🇸 English"),
        ),
        PopupMenuItem(
          value: Locale('es'),
          child: Text("🇦🇷 Español"),
        ),
        PopupMenuItem(
          value: Locale('it'),
          child: Text("🇮🇹 Italiano"),
        ),
      ],
    );
  }
}
