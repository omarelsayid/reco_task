import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reco_task/core/routes/pages_routes.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already  Have an Account?',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, PagesRoutes.login);
          },
          child: Text(
            'Sign In',
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
