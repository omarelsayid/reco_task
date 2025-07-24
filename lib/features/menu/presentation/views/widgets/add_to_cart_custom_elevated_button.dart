import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCartCustomElevatedButton extends StatelessWidget {
  const AddToCartCustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
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
                  border: Border.all(width: 12, color: const Color(0xFF103DE5)),
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
            child: Text(
              'Add to Cart',
              style: GoogleFonts.getFont(
                'Lato',
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
