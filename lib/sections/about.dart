import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';
import 'dart:js' as js; // Para abrir links en web

class AboutMeSection extends StatelessWidget {
  final void Function(Locale) onLocaleChange;
  
  const AboutMeSection({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          Text(
            loc.aboutTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),

          // Texto + Foto
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Texto descriptivo (75%)
              SizedBox(
                width: screenWidth * 0.75,
                child: Text(
                  loc.aboutDescription,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(width: 20),

              // Foto de perfil (25%)
              SizedBox(
                width: screenWidth * 0.20,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.blueAccent.withOpacity(0.2),
                  child: const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/foto_perfil.jpeg'),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Redes de contacto en fila
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _contactButton(
                icon: Icons.business,
                label: loc.aboutLinkedin,
                onTap: () => js.context.callMethod(
                  'open',
                  ['https://www.linkedin.com/in/jnahuel/'],
                ),
              ),
              _contactButton(
                icon: Icons.code,
                label: loc.aboutGithub,
                onTap: () => js.context.callMethod(
                  'open',
                  ['https://github.com/jnahuel-developer'],
                ),
              ),
              _contactButton(
                icon: Icons.phone,
                label: loc.aboutPhone,
                onTap: () => js.context.callMethod(
                  'open',
                  ['https://wa.me/5491161318972'],
                ),
              ),
              _contactButton(
                icon: Icons.email,
                label: loc.aboutEmail,
                onTap: () => js.context.callMethod(
                  'open',
                  ['mailto:jnahuel.developer@gmail.com'],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contactButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: Colors.blueAccent),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
