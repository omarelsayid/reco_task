import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final bool isLoading;
  final String title;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    super.key,
    required this.isLoading,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 319,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            colors: [Color(0xFF102DE1), Color(0xCC0D6EFF)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 278,
              top: 19,
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 12,
                      color: const Color(0xFF103DE5),
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 311,
              top: 36,
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  width: 5,
                  height: 5,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 218,
              top: -10,
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Center(
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
                      title,
                      style: GoogleFonts.getFont(
                        'Lato',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
