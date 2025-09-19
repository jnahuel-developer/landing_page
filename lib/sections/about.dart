import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';

class AboutMeSection extends StatelessWidget {
  final void Function(Locale) onLocaleChange;
  
  const AboutMeSection({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          Text(
            "Sobre mí",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            loc.aboutDescription,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
