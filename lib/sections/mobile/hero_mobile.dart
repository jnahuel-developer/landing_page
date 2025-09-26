import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';

class HeroSectionMobile extends StatelessWidget {
  const HeroSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Container(
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/electronics_bg.jpg"),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
        color: Color(0xFF00AEEF),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 Título dividido en 2 líneas
            Text(
              loc.heroMain_Mobile1,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              loc.heroMain_Mobile2,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // 🔹 Descripción dividida en 3 líneas
            Text(
              loc.heroExpanded_Mobile1,
              style: const TextStyle(fontSize: 20, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            Text(
              loc.heroExpanded_Mobile2,
              style: const TextStyle(fontSize: 20, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            Text(
              loc.heroExpanded_Mobile3,
              style: const TextStyle(fontSize: 20, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}