import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "J. Nahuel - Desarrollador",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00AEEF),
            ),
          ),
          Row(
            children: [
              _navButton("Sobre mí"),
              _navButton("Servicios"),
              _navButton("Contacto"),
            ],
          )
        ],
      ),
    );
  }

  Widget _navButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () {
          // TODO: implementar scroll a sección
        },
        child: Text(text, style: const TextStyle(color: Colors.black87)),
      ),
    );
  }
}
