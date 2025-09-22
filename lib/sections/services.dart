import 'package:flutter/material.dart';
import '../widgets/flip_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  final List<Map<String, String>> services = const [
    {
      "title": "Android",
      "description": "Desarrollo de apps en Flutter para Android y Web.",
      "image": "assets/servicios/tarjeta-servicio-android.jpg",
    },
    {
      "title": "Web",
      "description": "Desarrollo de aplicaciones web modernas y escalables.",
      "image": "assets/servicios/tarjeta-servicio-web.png",
    },
    {
      "title": "Bases de datos",
      "description": "Diseño y manejo de SQL para aplicaciones robustas.",
      "image": "assets/servicios/tarjeta-servicio-sql.jpg",
    },
    {
      "title": "Producto",
      "description": "Desarrollo de productos",
      "image": "assets/servicios/tarjeta-servicio-esquematicos.png",
    },
    {
      "title": "PCB",
      "description": "Diseño de esquemáticos, PCBs y optimización de costos productivos.",
      "image": "assets/servicios/tarjeta-servicio-hardware.jpg",
    },
    {
      "title": "Prototipado",
      "description": "Desarrollo de prototipado de productos electrónicos",
      "image": "assets/servicios/tarjeta-servicio-arduino.jpeg",
    },
    {
      "title": "Optimización de procesos",
      "description": "Análisis y mejora de procesos productivos y de software.",
      "image": "assets/servicios/tarjeta-servicio-optimizacion-procesos.png",
    },
    {
      "title": "IoT",
      "description": "Integración hardware-software en soluciones conectadas.",
      "image": "assets/servicios/tarjeta-servicio-iot.png",
    },
    {
      "title": "iOS",
      "description": "Desarrollo de apps en Flutter para iOS.",
      "image": "assets/servicios/tarjeta-servicio-ios.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Cálculo dinámico: 90% del ancho para tarjetas + espacios
    final availableWidth = screenWidth * 0.90;
    final spacing = availableWidth * 0.05 / 2; // 5% repartido entre huecos
    final cardWidth = (availableWidth - 2 * spacing) / 3;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: screenWidth * 0.05),
      child: Column(
        children: [
          const Text(
            "Servicios",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Distribución de las tarjetas
          Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: services
                .map((service) => SizedBox(
                      width: cardWidth,
                      child: FlipCard(
                        title: service["title"]!,
                        description: service["description"]!,
                        backgroundImage: service["image"]!,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
