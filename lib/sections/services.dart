import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';
import '../widgets/flip_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;

    // Lista de servicios con keys de traducción
    final services = [
      {
        "title": loc.serviceAndroidTitle,
        "description": loc.serviceAndroidDescription,
        "image": "assets/servicios/tarjeta-servicio-android.jpg",
      },
      {
        "title": loc.serviceWebTitle,
        "description": loc.serviceWebDescription,
        "image": "assets/servicios/tarjeta-servicio-web.png",
      },
      {
        "title": loc.serviceSqlTitle,
        "description": loc.serviceSqlDescription,
        "image": "assets/servicios/tarjeta-servicio-sql.jpg",
      },
      {
        "title": loc.serviceProductTitle,
        "description": loc.serviceProductDescription,
        "image": "assets/servicios/tarjeta-servicio-esquematicos.png",
      },
      {
        "title": loc.servicePcbTitle,
        "description": loc.servicePcbDescription,
        "image": "assets/servicios/tarjeta-servicio-hardware.jpg",
      },
      {
        "title": loc.servicePrototypeTitle,
        "description": loc.servicePrototypeDescription,
        "image": "assets/servicios/tarjeta-servicio-arduino.png",
      },
      {
        "title": loc.serviceOptimizationTitle,
        "description": loc.serviceOptimizationDescription,
        "image": "assets/servicios/tarjeta-servicio-optimizacion-procesos.png",
      },
      {
        "title": loc.serviceIotTitle,
        "description": loc.serviceIotDescription,
        "image": "assets/servicios/tarjeta-servicio-iot.png",
      },
      {
        "title": loc.serviceIosTitle,
        "description": loc.serviceIosDescription,
        "image": "assets/servicios/tarjeta-servicio-ios.jpg",
      },
    ];

    // Cálculo dinámico: 90% del ancho para tarjetas + espacios
    final availableWidth = screenWidth * 0.90;
    final spacing = availableWidth * 0.05 / 2; // 5% repartido entre huecos
    final cardWidth = (availableWidth - 2 * spacing) / 3;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: screenWidth * 0.05,
      ),
      child: Column(
        children: [
          Text(
            loc.servicesSectionTitle,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Distribución de las tarjetas
          Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: services
                .map(
                  (service) => SizedBox(
                    width: cardWidth,
                    child: FlipCard(
                      title: service["title"]!,
                      description: service["description"]!,
                      backgroundImage: service["image"]!,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
