import 'dart:math';
import 'dart:html' as html; // Solo para web: abrir nuevas pestañas
import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';

class AboutMeSection extends StatelessWidget {
  final void Function(Locale) onLocaleChange;

  const AboutMeSection({super.key, required this.onLocaleChange});

  // Actualizá estas URLs con tus enlaces reales
  static const String _linkedinUrl = "https://www.linkedin.com/in/jnahuel/";
  static const String _githubUrl = "https://github.com/jnahuel-developer";
  static const String _whatsappUrl = "https://wa.me/5491161318972";
  static const String _mailtoUrl = "mailto:jnahuel.developer@gmail.com";

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final screenWidth = MediaQuery.of(context).size.width;
    final sidePadding = max(16.0, screenWidth * 0.10);
    final innerWidth = screenWidth - sidePadding * 2;
    final leftWidth = innerWidth * 0.75;
    final rightWidth = innerWidth - leftWidth;
    const double horizontalGap = 40.0; // más aire entre texto y foto

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: sidePadding),
      child: LayoutBuilder(builder: (context, constraints) {
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Columna izquierda: texto + botones
              SizedBox(
                width: leftWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Texto descriptivo
                    Expanded(
                      flex: 8,
                      child: Text(
                        loc.aboutDescription,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 15,
                              height: 1.5,
                            ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Botones de contacto (ahora con íconos de assets)
                    SizedBox(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _contactButton(
                            width: (leftWidth - 3 * 16) / 4,
                            assetIcon: "assets/icons/linkedin.png",
                            label: loc.aboutLinkedin,
                            onTap: () => _openUrl(_linkedinUrl),
                          ),
                          _contactButton(
                            width: (leftWidth - 3 * 16) / 4,
                            assetIcon: "assets/icons/github.png",
                            label: loc.aboutGithub,
                            onTap: () => _openUrl(_githubUrl),
                          ),
                          _contactButton(
                            width: (leftWidth - 3 * 16) / 4,
                            assetIcon: "assets/icons/whatsapp.png",
                            label: loc.aboutPhone,
                            onTap: () => _openUrl(_whatsappUrl),
                          ),
                          _contactButton(
                            width: (leftWidth - 3 * 16) / 4,
                            assetIcon: "assets/icons/gmail.png",
                            label: loc.aboutEmail,
                            onTap: () => _openUrl(_mailtoUrl),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: horizontalGap),

              // Columna derecha: foto
              SizedBox(
                width: rightWidth,
                child: LayoutBuilder(builder: (ctx, c2) {
                  final containerHeight =
                      c2.maxHeight.isFinite ? c2.maxHeight : 400.0;
                  final double diameter =
                      min(containerHeight * 0.95, rightWidth * 0.95);

                  return Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Efecto de halo detrás
                        Container(
                          width: diameter * 1.15,
                          height: diameter * 1.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                const Color(0xFFDBEEFF),
                                const Color(0xFFEAF6FF),
                                Colors.white.withOpacity(0.0),
                              ],
                              stops: const [0.0, 0.6, 1.0],
                              center: const Alignment(-0.2, -0.2),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.2),
                                blurRadius: 40,
                                spreadRadius: 8,
                              ),
                            ],
                          ),
                        ),

                        // Foto circular con borde
                        Container(
                          width: diameter,
                          height: diameter,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue.shade200,
                              width: 6,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/foto_perfil.jpeg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _contactButton({
    required double width,
    required String assetIcon,
    required String label,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          side: const BorderSide(color: Color(0xFFBFDFF0)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(assetIcon, height: 26, width: 26),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openUrl(String url) {
    try {
      html.window.open(url, '_blank');
    } catch (_) {}
  }
}