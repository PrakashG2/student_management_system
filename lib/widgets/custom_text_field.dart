import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller; // Added for text input control
  final String? Function(String?)? validator; // Added for input validation

  const CustomTextField({
    required this.label,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField( // Use TextFormField for validation integration
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(), // Visually distinguish fields
      ),
    );
  }
}
