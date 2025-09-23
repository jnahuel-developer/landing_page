import 'dart:math';
import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';

class FlipCard extends StatefulWidget {
  final String title;
  final String description;
  final String longDescription;
  final String examples;
  final String? backgroundImage;

  const FlipCard({
    super.key,
    required this.title,
    required this.description,
    required this.longDescription,
    required this.examples,
    this.backgroundImage,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isFront = true;

  bool _isHoveringBackButton = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
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

  /// --- Abrir pop-up en cara trasera ---
  void _showDetailPopup(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    // Dividir los ejemplos en lista (se almacenan en el .arb con "\n")
    final examples = widget.examples?.split("\n") ?? [];

    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Título ---
                Center(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),

                // --- Descripción larga ---
                Text(
                  widget.longDescription ?? "",
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),

                // --- Ejemplos ---
                if (examples.isNotEmpty) ...[
                  const Text(
                    "Ejemplos:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Lista tipo tabla con colores alternados
                  Column(
                    children: List.generate(examples.length, (index) {
                      final example = examples[index].replaceAll("• ", "");
                      final bgColor =
                          index.isEven ? Colors.grey[200] : Colors.white;
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        color: bgColor,
                        child: Text(
                          "• $example",
                          style: const TextStyle(fontSize: 15),
                        ),
                      );
                    }),
                  ),
                ],

                const SizedBox(height: 20),

                // --- Botón cerrar ---
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: Text(loc.flipCardPopupClose),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: GestureDetector(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final angle = _controller.value * pi;
            final transform = Matrix4.rotationY(angle);
            return Transform(
              transform: transform,
              alignment: Alignment.center,
              child: _controller.value < 0.5
                  ? _buildFront(loc)
                  : Transform(
                      transform: Matrix4.rotationY(pi),
                      alignment: Alignment.center,
                      child: _buildBack(loc),
                    ),
            );
          },
        ),
      ),
    );
  }

  /// --- CARA FRONTAL ---
  Widget _buildFront(AppLocalizations loc) {
    return _cardBase(
      Stack(
        fit: StackFit.expand,
        children: [
          if (widget.backgroundImage != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.backgroundImage!,
                fit: BoxFit.cover,
              ),
            ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Center(
            child: Stack(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 5
                      ..color = Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 250 * 0.18,
            left: 0,
            right: 0,
            child: Center(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.lightBlue, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: Text(
                  loc.flipCardFalseKnowMore,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
      color: Colors.transparent,
    );
  }

  /// --- CARA TRASERA ---
  Widget _buildBack(AppLocalizations loc) {
    return _cardBase(
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Positioned(
            bottom: 250 * 0.18,
            left: 0,
            right: 0,
            child: Center(
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHoveringBackButton = true),
                onExit: (_) => setState(() => _isHoveringBackButton = false),
                child: AnimatedScale(
                  scale: _isHoveringBackButton ? 1.5 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: OutlinedButton(
                    onPressed: () => _showDetailPopup(context),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.lightBlue, width: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text(
                      loc.flipCardTrueKnowMore,
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      color: Colors.white,
    );
  }

  /// --- BASE DE TARJETA ---
  Widget _cardBase(
    Widget child, {
    required Color color,
  }) {
    return Container(
      width: 300,
      height: 250,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.lightBlue, width: 3),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 20,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: child,
    );
  }
}
