import 'package:flutter/material.dart';

class PFRLogoWidget extends StatelessWidget {
  const PFRLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/logo3.png",
        ),
        const SizedBox(height: 16),
        Text(
          'Пенсионный фонд Российской Федерации'.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28.0,
          ),
        ),
      ],
    );
  }
}
