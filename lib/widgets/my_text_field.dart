import 'package:flutter/material.dart';

class MyTextFieldWithBorder extends StatelessWidget {
  const MyTextFieldWithBorder({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.enabled = true,
  });

  final String hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: (prefixIcon != null) ? Icon(prefixIcon) : null,
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.controller,
    this.enabled,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            hintText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 6.0),
        TextField(
          enabled: enabled,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
