import 'package:flutter/material.dart';

void showAutoDismissAlert(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder:
        (context) => Positioned(
          bottom: 80,
          left: 20,
          right: 20,
          child: Material(
            color: Colors.transparent,
            child: AnimatedAlertCard(message: message),
          ),
        ),
  );

  overlay.insert(overlayEntry);

  // Remove it after 3 seconds
  Future.delayed(Duration(seconds: 3)).then((_) => overlayEntry.remove());
}

class AnimatedAlertCard extends StatefulWidget {
  final String message;
  const AnimatedAlertCard({super.key, required this.message});

  @override
  State<AnimatedAlertCard> createState() => _AnimatedAlertCardState();
}

class _AnimatedAlertCardState extends State<AnimatedAlertCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.info_outline, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
