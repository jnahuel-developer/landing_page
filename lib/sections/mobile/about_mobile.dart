import 'dart:html' as html; // Solo para web
import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';

class AboutMeSectionMobile extends StatefulWidget {
  final void Function(Locale) onLocaleChange;

  const AboutMeSectionMobile({super.key, required this.onLocaleChange});

  @override
  State<AboutMeSectionMobile> createState() => _AboutMeSectionMobileState();
}

class _AboutMeSectionMobileState extends State<AboutMeSectionMobile> {
  bool _expanded = false;

  // URLs reales
  static const String _linkedinUrl = "https://www.linkedin.com/in/jnahuel/";
  static const String _githubUrl = "https://github.com/jnahuel-developer";
  static const String _whatsappUrl = "https://wa.me/5491161318972";
  static const String _mailtoUrl = "mailto:jnahuel.developer@gmail.com";

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Center(
        child: Container(
          width: screenWidth * 0.9,
          padding: const EdgeInsets.all(24),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              // 🔹 Foto perfil con halo
              _profilePhoto(),

              const SizedBox(height: 30),

              // 🔹 Texto corto con botón expandible
              AnimatedCrossFade(
                firstChild: Column(
                  children: [
                    Text(
                      loc.aboutShortDescription,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18,
                            height: 1.6,
                            color: Colors.black87,
                          ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      child: _BreathingButton(
                        label: loc.aboutShowMore,
                        onPressed: () {
                          setState(() {
                            _expanded = true;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
                secondChild: Text(
                  loc.aboutDescription,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                ),
                crossFadeState: _expanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 400),
              ),

              const SizedBox(height: 30),

              // 🔹 Botones de contacto en columna
              _contactButton(
                assetIcon: "assets/icons/linkedin.png",
                label: loc.aboutLinkedin,
                onTap: () => _openUrl(_linkedinUrl),
              ),
              const SizedBox(height: 16),
              _contactButton(
                assetIcon: "assets/icons/github.png",
                label: loc.aboutGithub,
                onTap: () => _openUrl(_githubUrl),
              ),
              const SizedBox(height: 16),
              _contactButton(
                assetIcon: "assets/icons/whatsapp.png",
                label: loc.aboutPhone,
                onTap: () => _openUrl(_whatsappUrl),
              ),
              const SizedBox(height: 16),
              _contactButton(
                assetIcon: "assets/icons/gmail.png",
                label: loc.aboutEmail,
                onTap: () => _openUrl(_mailtoUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// --- FOTO DE PERFIL ---
  Widget _profilePhoto() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.blue.shade200,
          width: 5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlue.withOpacity(0.4),
            blurRadius: 40,
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
    );
  }

  /// --- BOTONES DE CONTACTO ---
  Widget _contactButton({
    required String assetIcon,
    required String label,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          side: const BorderSide(color: Colors.lightBlue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
        ),
        child: Row(
          children: [
            Image.asset(assetIcon, height: 24, width: 24),
            const SizedBox(width: 12),
            Expanded(
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

  /// --- ABRIR LINKS ---
  void _openUrl(String url) {
    try {
      html.window.open(url, '_blank');
    } catch (_) {}
  }
}

/// --- BOTÓN "RESPIRANDO" (reusado del Desktop) ---
class _BreathingButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final double height;

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
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: const StadiumBorder(),
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            child: Text(
              widget.label,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        );
      },
    );
  }
}
