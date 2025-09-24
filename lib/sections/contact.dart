import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:landing_page/l10n/generated/app_localizations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _sendEmail(String name, String email, String message, String createdAt, String status) async {
    const serviceId = "service_ei86fvw";
    const templateId = "template_cgvhuhp";
    const userId = "B69ZDl4IKuJmRkCI0";

    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(
      url,
      headers: {
        "origin": "http://localhost",
        "Content-Type": "application/json",
      },
      body: json.encode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "template_params": {
          "from_name": name,
          "from_email": email,
          "message": message,
          "createdAt": createdAt,
          "status": status,
        },
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Error al enviar email: ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      color: Colors.grey.shade100,
      child: Column(
        children: [
          Text(
            loc.contactTitle,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _textField(loc.contactName, nameController),
          const SizedBox(height: 15),
          _textField(loc.contactEmail, emailController),
          const SizedBox(height: 15),
          _textField(loc.contactMessage, messageController, maxLines: 5),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00AEEF),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            onPressed: () async {
              final name = nameController.text.trim();
              final email = emailController.text.trim();
              final message = messageController.text.trim();

              try {
                // Guardar en Firestore
                final doc = await FirebaseFirestore.instance.collection('contacts').add({
                  'name': name,
                  'email': email,
                  'message': message,
                  'createdAt': FieldValue.serverTimestamp(),
                  'status': 'new',
                });

                // Enviar correo con EmailJS
                await _sendEmail(name, email, message, DateTime.now().toIso8601String(), "new");

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(loc.contactSentSuccess)),
                );

                nameController.clear();
                emailController.clear();
                messageController.clear();
              } catch (e, stack) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(loc.contactSentError)),
                );
              }
            },
            child: Text(
              loc.contactSend,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}