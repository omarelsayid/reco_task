import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reco_task/core/routes/pages_routes.dart';

class DonotHaveAnAccountWidget extends StatelessWidget {
  const DonotHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, PagesRoutes.register);
          },
          child: Text(
            'Sign Up',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: const Color(0xFF103DE5),
            ),
          ),
        ),
      ],
    );
  }
}
