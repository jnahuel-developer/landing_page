import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';
import '../../widgets/flip_card_mobile.dart'; // versión adaptada

class ServicesSectionMobile extends StatelessWidget {
  const ServicesSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;

    // Lista de servicios con keys de traducción
    final services = [
      {
        "title": loc.serviceAndroidTitle,
        "description": loc.serviceAndroidDescription,
        "serviceSubtitle": loc.serviceAndroidSubtitle,
        "longDescription": loc.serviceAndroidLongDescription,
        "examples": loc.serviceAndroidExamples,
        "image": "assets/servicios/tarjeta-servicio-android.jpg",
      },
      {
        "title": loc.serviceWebTitle,
        "description": loc.serviceWebDescription,
        "serviceSubtitle": loc.serviceWebSubtitle,
        "longDescription": loc.serviceWebLongDescription,
        "examples": loc.serviceWebExamples,
        "image": "assets/servicios/tarjeta-servicio-web.png",
      },
      {
        "title": loc.serviceDesktopTitle,
        "description": loc.serviceDesktopDescription,
        "serviceSubtitle": loc.serviceDesktopSubtitle,
        "longDescription": loc.serviceDesktopLongDescription,
        "examples": loc.serviceDesktopExamples,
        "image": "assets/servicios/tarjeta-servicio-desktop.png",
      },
      {
        "title": loc.serviceChatbotTitle,
        "description": loc.serviceChatbotDescription,
        "serviceSubtitle": loc.serviceChatbotSubtitle,
        "longDescription": loc.serviceChatbotLongDescription,
        "examples": loc.serviceChatbotExamples,
        "image": "assets/servicios/tarjeta-servicio-chatbot.jpg",
      },
      {
        "title": loc.serviceIATitle,
        "description": loc.serviceIADescription,
        "serviceSubtitle": loc.serviceIASubtitle,
        "longDescription": loc.serviceIALongDescription,
        "examples": loc.serviceIAExamples,
        "image": "assets/servicios/tarjeta-servicio-ai.jpg",
      },
      {
        "title": loc.serviceSqlTitle,
        "description": loc.serviceSqlDescription,
        "serviceSubtitle": loc.serviceSqlSubtitle,
        "longDescription": loc.serviceSqlLongDescription,
        "examples": loc.serviceSqlExamples,
        "image": "assets/servicios/tarjeta-servicio-sql.jpg",
      },
      {
        "title": loc.serviceProductTitle,
        "description": loc.serviceProductDescription,
        "serviceSubtitle": loc.serviceProductSubtitle,
        "longDescription": loc.serviceProductLongDescription,
        "examples": loc.serviceProductExamples,
        "image": "assets/servicios/tarjeta-servicio-esquematicos.png",
      },
      {
        "title": loc.servicePcbTitle,
        "description": loc.servicePcbDescription,
        "serviceSubtitle": loc.servicePcbSubtitle,
        "longDescription": loc.servicePcbLongDescription,
        "examples": loc.servicePcbExamples,
        "image": "assets/servicios/tarjeta-servicio-hardware.jpg",
      },
      {
        "title": loc.servicePrototypeTitle,
        "description": loc.servicePrototypeDescription,
        "serviceSubtitle": loc.servicePrototypeSubtitle,
        "longDescription": loc.servicePrototypeLongDescription,
        "examples": loc.servicePrototypeExamples,
        "image": "assets/servicios/tarjeta-servicio-arduino.png",
      },
      {
        "title": loc.serviceOptimizationTitle,
        "description": loc.serviceOptimizationDescription,
        "serviceSubtitle": loc.serviceOptimizationSubtitle,
        "longDescription": loc.serviceOptimizationLongDescription,
        "examples": loc.serviceOptimizationExamples,
        "image": "assets/servicios/tarjeta-servicio-optimizacion-procesos.png",
      },
      {
        "title": loc.serviceIotTitle,
        "description": loc.serviceIotDescription,
        "serviceSubtitle": loc.serviceIotSubtitle,
        "longDescription": loc.serviceIotLongDescription,
        "examples": loc.serviceIotExamples,
        "image": "assets/servicios/tarjeta-servicio-iot.png",
      },
      {
        "title": loc.serviceIosTitle,
        "description": loc.serviceIosDescription,
        "serviceSubtitle": loc.serviceIosSubtitle,
        "longDescription": loc.serviceIosLongDescription,
        "examples": loc.serviceIosExamples,
        "image": "assets/servicios/tarjeta-servicio-ios.jpg",
      },
    ];

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        // 🔹 Resetear tarjetas si se scrollea más de X píxeles
        if (scrollInfo is ScrollUpdateNotification &&
            scrollInfo.scrollDelta != null &&
            scrollInfo.scrollDelta!.abs() > 20) {
          FlipCardMobile.resetAllCards();
        }
        return false;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            Text(
              loc.servicesSectionTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Tarjetas en columna
            Column(
              children: services
                  .map(
                    (service) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        width: screenWidth * 0.9,
                        child: FlipCardMobile(
                          title: service["title"]!,
                          description: service["description"]!,
                          longDescription: service["longDescription"]!,
                          subtitle: service["serviceSubtitle"]!,
                          examples: service["examples"]!,
                          backgroundImage: service["image"]!,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
