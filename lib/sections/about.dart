import 'dart:math';
import 'dart:html' as html; // Solo para web: abrir nuevas pestañas
import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';
import 'dart:ui_web' as ui_web;

class AboutMeSection extends StatelessWidget {
  final void Function(Locale) onLocaleChange;

  const AboutMeSection({super.key, required this.onLocaleChange});

  // Actualizá estas URLs con tus enlaces reales
  static const String _linkedinUrl = "https://www.linkedin.com/in/jnahuel/";
  static const String _githubUrl = "https://github.com/jnahuel-developer";
  static const String _whatsappUrl = "https://wa.me/5491161318972";
  static const String _mailtoUrl = "mailto:jnahuel.developer@gmail.com";
  static const String _youtubeUrl =
      "https://www.youtube.com/embed/Eq5xIiQquZU";

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final screenWidth = MediaQuery.of(context).size.width;
    final sidePadding = max(12.0, screenWidth * 0.05); // menos margen lateral
    final innerWidth = screenWidth - sidePadding * 2;
    final leftWidth = innerWidth * 0.65;
    final rightWidth = innerWidth - leftWidth;
    const double horizontalGap = 50.0; // separación entre texto y foto

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: sidePadding),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.lightBlue.withOpacity(0.25),
                blurRadius: 50,
                spreadRadius: 15,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Columna izquierda: texto + botones
                  SizedBox(
                    width: leftWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Texto descriptivo
                        Text(
                          loc.aboutDescription,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: 18,
                                height: 1.6,
                                color: Colors.black87,
                              ),
                        ),
                        const SizedBox(height: 30),

                        // Botones de contacto
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

                  // Columna derecha: foto con botón flotante
                  SizedBox(
                    width: rightWidth,
                    child: LayoutBuilder(builder: (ctx, c2) {
                      final containerHeight =
                          c2.maxHeight.isFinite ? c2.maxHeight : 350.0;
                      final double diameter =
                          min(containerHeight * 0.9, rightWidth * 1.1);

                      return Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Halo de fondo
                            Container(
                              width: diameter * 1.05,
                              height: diameter * 1.05,
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
                                    color: Colors.blue.withOpacity(0.3),
                                    blurRadius: 50,
                                    spreadRadius: 12,
                                  ),
                                ],
                              ),
                            ),

                            // Foto circular
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

                            // Botón flotante
                            Positioned(
                              bottom: diameter * 0.20,
                              child: ElevatedButton(
                                onPressed: () {
                                  _showPresentationDialog(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF00AEEF),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22, vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  loc.aboutPresentation,
                                  style: const TextStyle(fontSize: 20),
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
        ),
      ),
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
                  fontSize: 18,
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

  void _showPresentationDialog(BuildContext context) {
    // Solo funciona en Flutter Web
    // ignore: undefined_prefixed_name
    // Usamos dart:ui_web para registrar el iframe
    // Esto evita conflictos en Mobile/Desktop
    // IMPORTANTE: en la parte superior del archivo agregar:
    // import 'dart:ui_web' as ui_web;

    ui_web.platformViewRegistry.registerViewFactory(
      'youtube-iframe',
      (int viewId) => html.IFrameElement()
        ..src = _youtubeUrl
        ..style.border = 'none',
    );

    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          insetPadding: const EdgeInsets.all(40),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: SizedBox(
            width: 800,
            height: 450,
            child: const HtmlElementView(viewType: 'youtube-iframe'),
          ),
        );
      },
    );
  }
}