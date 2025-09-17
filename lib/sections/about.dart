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
            "Soy Ingeniero Electrónico con más de 6 años de experiencia entre la industria médica y la industria financiera."
            "Me focalizo en las mejoras de producto, buscando aumentar la calidad con reducción de costos productivos."
            "He desarrollado y puesto en comercialización el “Purity UV”, así como más de 10 proyectos internos.\n\n"
            "Reduje hasta 20% los costos productivos de electrónica, hasta un 30% el retrabajo por fallas comunes,"
            "y hasta un 50% el tiempo de calibración y control de los equipos.\n\n"
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
