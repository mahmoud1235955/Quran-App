import 'package:flutter/material.dart';

class ElevaedButtonWidget extends StatelessWidget {
  const ElevaedButtonWidget({
    super.key,
    required this.onPressed,
    required this.label,
    required this.color,
    required this.textColor,
  });
  final VoidCallback onPressed;
  final String label;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: const Size(80, 37),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 10,
        ),
      ),
    );
  }
}
