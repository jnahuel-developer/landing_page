import 'dart:math';
import 'package:flutter/material.dart';
import '../pages/service_detail_page.dart';

class FlipCard extends StatefulWidget {
  final String title;
  final String description;
  final String? backgroundImage; // 👈 nuevo parámetro

  const FlipCard({
    super.key,
    required this.title,
    required this.description,
    this.backgroundImage,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  void _onHover(bool hovering) {
    if (hovering && _isFront) {
      _controller.forward();
      _isFront = false;
    } else if (!hovering && !_isFront) {
      _controller.reverse();
      _isFront = true;
    }
  }

  void _onClick() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceDetailPage(
          title: widget.title,
          description: widget.description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        onTap: _onClick,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final angle = _controller.value * pi;
            final transform = Matrix4.rotationY(angle);
            return Transform(
              transform: transform,
              alignment: Alignment.center,
              child: _controller.value < 0.5
                  ? _buildFront()
                  : Transform(
                      transform: Matrix4.rotationY(pi),
                      alignment: Alignment.center,
                      child: _buildBack(),
                    ),
            );
          },
        ),
      ),
    );
  }

  /// --- CARA FRONTAL ---
  Widget _buildFront() {
    return _cardBase(
      Stack(
        fit: StackFit.expand,
        children: [
          // Imagen de fondo (si existe)
          if (widget.backgroundImage != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.backgroundImage!,
                fit: BoxFit.cover,
              ),
            ),

          // Overlay oscuro para contraste
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withOpacity(0.4),
            ),
          ),

          // Título centrado
          Center(
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      color: Colors.transparent,
    );
  }

  /// --- CARA TRASERA ---
  Widget _buildBack() {
    return _cardBase(
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          widget.description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      color: Colors.white,
      borderColor: const Color(0xFF00AEEF),
    );
  }

  /// --- BASE DE TARJETA ---
  Widget _cardBase(
    Widget child, {
    required Color color,
    Color borderColor = Colors.transparent,
  }) {
    return Container(
      width: 300,
      height: 250,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: child,
    );
  }
}
