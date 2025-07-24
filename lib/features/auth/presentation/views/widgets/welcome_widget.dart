import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.getFont(
            'Lato',
            color: const Color(0xff0d120E),
            fontWeight: FontWeight.bold,
            letterSpacing: 0.2,
            fontSize: 23,
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.getFont(
            'Lato',
            color: const Color(0xff0d120E),
            fontWeight: FontWeight.bold,
            letterSpacing: 0.2,
            fontSize: 14,
          ),
        ),
        Image.asset('assets/images/Illustration.png', width: 200, height: 200),
      ],
    );
  }
}
