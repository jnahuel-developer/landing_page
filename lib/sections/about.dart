import 'dart:math';
import 'dart:html' as html; // Solo para web: abrir nuevas pestañas
import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';

class AboutMeSection extends StatelessWidget {
  final void Function(Locale) onLocaleChange;

  const AboutMeSection({super.key, required this.onLocaleChange});

  // Actualizá estas URLs con tus enlaces reales
  static const String _linkedinUrl = "https://www.linkedin.com/in/TU_USUARIO/";
  static const String _githubUrl = "https://github.com/TU_USUARIO";
  static const String _whatsappUrl = "https://wa.me/549TU_NUMERO"; // formato: 549 + número sin ceros ni signos
  static const String _mailtoUrl = "mailto:TU_CORREO@dominio.com";

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final screenWidth = MediaQuery.of(context).size.width;
    // 10% de espacio a cada lateral
    final sidePadding = max(16.0, screenWidth * 0.10);
    final innerWidth = screenWidth - sidePadding * 2;
    final leftWidth = innerWidth * 0.75;
    final rightWidth = innerWidth - leftWidth;
    const double horizontalGap = 20.0;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: sidePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          Text(
            loc.aboutTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20),

          // Area principal: texto + foto (alineadas en altura)
          LayoutBuilder(builder: (context, constraints) {
            // constraints.maxWidth ≈ innerWidth
            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Bloque izquierdo: texto (75%) y botones debajo
                  SizedBox(
                    width: leftWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Texto descriptivo ocupa la mayor parte vertical (flex)
                        Expanded(
                          flex: 8,
                          child: SingleChildScrollView(
                            // En caso de que la descripción sea muy larga
                            child: Text(
                              loc.aboutDescription,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        // Botones de contacto — ocupan 20% (visual) y tienen el mismo ancho entre sí
                        SizedBox(
                          height: 64, // altura fija para los botones
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _contactButton(
                                width: (leftWidth - 3 * 12) / 4,
                                icon: Icons.business,
                                label: loc.aboutLinkedin,
                                onTap: () => _openUrl(_linkedinUrl),
                              ),
                              _contactButton(
                                width: (leftWidth - 3 * 12) / 4,
                                icon: Icons.code,
                                label: loc.aboutGithub,
                                onTap: () => _openUrl(_githubUrl),
                              ),
                              _contactButton(
                                width: (leftWidth - 3 * 12) / 4,
                                icon: Icons.email,
                                label: loc.aboutPhone,
                                onTap: () => _openUrl(_whatsappUrl),
                              ),
                              _contactButton(
                                width: (leftWidth - 3 * 12) / 4,
                                icon: Icons.email,
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

                  // Bloque derecho: foto circular con "iluminación" detrás.
                  // Su altura será la misma que el bloque izquierdo (por IntrinsicHeight).
                  SizedBox(
                    width: rightWidth,
                    child: LayoutBuilder(builder: (ctx, c2) {
                      final containerHeight = c2.maxHeight.isFinite ? c2.maxHeight : 300.0;
                      // diámetro máximo de la esfera, dejando un poco de margen
                      final double diameter = min(containerHeight * 0.92, rightWidth * 0.92);

                      return Center(
                        child: SizedBox(
                          width: rightWidth,
                          height: containerHeight,
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Luz / halo detrás (efecto decorativo)
                                Container(
                                  width: diameter * 1.02,
                                  height: diameter * 1.02,
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
                                        color: Colors.blue.withOpacity(0.18),
                                        blurRadius: 30,
                                        spreadRadius: 6,
                                      ),
                                    ],
                                  ),
                                ),

                                // Borde exterior del círculo (para que destaque)
                                Container(
                                  width: diameter,
                                  height: diameter,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.blue.shade100, width: 6),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/foto_perfil.jpeg",
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        // En caso de no encontrar la imagen, mostramos un placeholder
                                        return Container(
                                          color: Colors.grey.shade200,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Mi foto",
                                            textAlign: TextAlign.center,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _contactButton({
    required double width,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: width,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: const Color(0xFF00AEEF)),
        label: Text(label, style: const TextStyle(color: Colors.black87)),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          side: const BorderSide(color: Color(0xFFBFDFF0)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
    );
  }

  void _openUrl(String url) {
    try {
      html.window.open(url, '_blank');
    } catch (e) {
      // Fallback: nada
    }
  }
}
