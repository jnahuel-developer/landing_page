import 'dart:math';
import 'package:flutter/material.dart';
import 'package:landing_page/l10n/generated/app_localizations.dart';

class FlipCardMobile extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final String longDescription;
  final String examples;
  final String? backgroundImage;

  const FlipCardMobile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.longDescription,
    required this.examples,
    this.backgroundImage,
  });

  @override
  State<FlipCardMobile> createState() => _FlipCardMobileState();

  /// --- Reset global ---
  static final List<_FlipCardMobileState> _cards = [];

  static void resetAllCards() {
    for (var card in _cards) {
      card._resetToFront();
    }
  }
}

class _FlipCardMobileState extends State<FlipCardMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    FlipCardMobile._cards.add(this);
  }

  @override
  void dispose() {
    FlipCardMobile._cards.remove(this);
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  void _resetToFront() {
    if (!_isFront) {
      _controller.reverse();
      _isFront = true;
    }
  }

  /// --- Pop-up detalle ---
  void _showDetailPopup(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final examples = widget.examples.split("\n");

    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.longDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (examples.isNotEmpty) ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${loc.titleExamples}:",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: List.generate(examples.length, (index) {
                        final example = examples[index].replaceAll("• ", "");
                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          color: index.isEven
                              ? Colors.grey[200]
                              : Colors.transparent,
                          child: Text("• $example"),
                        );
                      }),
                    ),
                  ],
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00AEEF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () => Navigator.pop(ctx),
                    child: Text(
                      loc.flipCardPopupClose,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return GestureDetector(
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
    );
  }

  /// --- Cara frontal ---
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
                    fontSize: 22,
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
                    fontSize: 22,
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
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: OutlinedButton(
                onPressed: _flipCard,
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.lightBlue, width: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
                child: Text(
                  loc.flipCardFalseKnowMore,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
      color: Colors.transparent,
    );
  }

  /// --- Cara trasera ---
  Widget _buildBack(AppLocalizations loc) {
    return _cardBase(
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              widget.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: OutlinedButton(
                onPressed: () => _showDetailPopup(context),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.lightBlue, width: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
                child: Text(
                  loc.flipCardTrueKnowMore,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
      color: Colors.white,
    );
  }

  /// --- Base de tarjeta ---
  Widget _cardBase(
    Widget child, {
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      height: 220,
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