import 'dart:math';
import 'dart:html' as html; // Solo para web: abrir nuevas pestañas
import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';
import 'dart:ui_web' as ui_web;

class AboutMeSection extends StatelessWidget {
  final void Function(Locale) onLocaleChange;

  const AboutMeSection({super.key, required this.onLocaleChange});

  // URLs reales
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
                blurRadius: 35,
                spreadRadius: 15,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Columna izquierda: texto + botones
              Expanded(
                flex: 2,
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
                            width: (innerWidth * 0.65 - 3 * 16) / 4,
                            assetIcon: "assets/icons/linkedin.png",
                            label: loc.aboutLinkedin,
                            onTap: () => _openUrl(_linkedinUrl),
                          ),
                          _contactButton(
                            width: (innerWidth * 0.65 - 3 * 16) / 4,
                            assetIcon: "assets/icons/github.png",
                            label: loc.aboutGithub,
                            onTap: () => _openUrl(_githubUrl),
                          ),
                          _contactButton(
                            width: (innerWidth * 0.65 - 3 * 16) / 4,
                            assetIcon: "assets/icons/whatsapp.png",
                            label: loc.aboutPhone,
                            onTap: () => _openUrl(_whatsappUrl),
                          ),
                          _contactButton(
                            width: (innerWidth * 0.65 - 3 * 16) / 4,
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

              const SizedBox(width: 40),

              // Columna derecha: foto + botón flotante
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _profileWithButton(context, loc),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// --- FOTO DE PERFIL + BOTÓN DEBAJO ---
  Widget _profileWithButton(BuildContext context, AppLocalizations loc) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // tamaño dinámico: 85% del menor lado disponible
        final double size = 0.85 * (constraints.maxWidth < constraints.maxHeight
            ? constraints.maxWidth
            : constraints.maxHeight);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Foto con halo radial
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue.shade200,
                  width: 6,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightBlue.withOpacity(0.4),
                    blurRadius: 60,
                    spreadRadius: 10,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/foto_perfil.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Botón con mismo ancho de la foto
            SizedBox(
              width: size,
              child: _BreathingButton(
                label: loc.aboutPresentation,
                onPressed: () => _showPresentationDialog(context),
              ),
            ),
          ],
        );
      },
    );
  }


  /// --- BOTONES DE CONTACTO ---
  Widget _contactButton({
    required double width,
    required String assetIcon,
    required String label,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: width,
      height: 120,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          side: const BorderSide(color: Colors.lightBlue),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(assetIcon, height: 30, width: 30),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 30,
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

  /// --- ABRIR LINKS ---
  void _openUrl(String url) {
    try {
      html.window.open(url, '_blank');
    } catch (_) {}
  }

  /// --- POPUP CON YOUTUBE ---
  void _showPresentationDialog(BuildContext context) {
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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

/// --- BOTÓN "RESPIRANDO" ---
class _BreathingButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final double width; // ancho dinámico
  final double height; // alto dinámico

  const _BreathingButton({
    required this.label,
    required this.onPressed,
    this.width = 200,
    this.height = 48,
  });

  @override
  State<_BreathingButton> createState() => _BreathingButtonState();
}

class _BreathingButtonState extends State<_BreathingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 4.0, end: 16.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(widget.height / 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: _animation.value,
                spreadRadius: _animation.value / 2,
                offset: const Offset(0, 0), // centrada
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: const StadiumBorder(),
              shadowColor: Colors.transparent, // sin sombra extra
              elevation: 0,
            ),
            child: Text(
              widget.label,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        );
      },
    );
  }
}
