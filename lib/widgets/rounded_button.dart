import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color; // Added for customization

  const RoundedButton({
    required this.label,
    required this.onPressed,
    this.color = Colors.blue, // Default button color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(color: Colors.white)), // Consistent white text
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: color, // Apply specified color
      ),
    );
  }
}
