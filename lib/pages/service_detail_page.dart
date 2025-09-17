import 'package:flutter/material.dart';

class ServiceDetailPage extends StatelessWidget {
  final String title;
  final String description;

  const ServiceDetailPage({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF00AEEF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          "Detalles sobre $title:\n\n$description\n\nAquí podrás mostrar proyectos relacionados y ejemplos reales.",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
