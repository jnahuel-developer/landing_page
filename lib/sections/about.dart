import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Column(
        children: const [
          Text(
            "Sobre mí",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "Soy ingeniero electrónico con amplia experiencia en hardware, software y firmware. "
            "Trabajo en desarrollo de aplicaciones móviles y web con Flutter, "
            "aplicaciones de escritorio en C/C++ con interfaces gráficas, "
            "bases de datos SQL, diseño de PCBs, integración IoT y redacción de informes técnicos.\n\n"
            "Mi objetivo es ayudar a empresas y personas a llevar sus ideas a la realidad, "
            "combinando software y hardware de manera eficiente.",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
