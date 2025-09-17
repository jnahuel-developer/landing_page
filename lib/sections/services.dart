import 'package:flutter/material.dart';
import '../widgets/flip_card.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  final List<Map<String, String>> services = const [
    {"title": "Android", "description": "Desarrollo de apps en Flutter para Android y Web."},
    {"title": "PCBs", "description": "Diseño de esquemáticos, PCBs y optimización de costos productivos."},
    {"title": "Firmware", "description": "Programación en C/C++ para microcontroladores."},
    {"title": "IoT", "description": "Integración hardware-software en soluciones conectadas."},
    {"title": "Investigación", "description": "Redacción de informes técnicos y estudios especializados."},
    {"title": "Bases de datos", "description": "Diseño y manejo de SQL para aplicaciones robustas."},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final spacing = 20.0;
    final cardWidth = (screenWidth - (4 * spacing)) / 3;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: [
          const Text(
            "Servicios",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: services
                .map((service) => SizedBox(
                      width: cardWidth,
                      child: FlipCard(
                        title: service["title"]!,
                        description: service["description"]!,
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
