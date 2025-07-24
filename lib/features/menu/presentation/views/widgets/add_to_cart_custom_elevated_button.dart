import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reco_task/core/utils/show_snack_bar.dart';
import 'package:reco_task/features/cart/data/models/cart_item.dart';
import 'package:reco_task/features/cart/presentation/cubit/cart_cubit.dart';

class AddToCartCustomElevatedButton extends StatelessWidget {
  const AddToCartCustomElevatedButton({super.key, required this.item});
  final QueryDocumentSnapshot<Object?> item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CartCubit>().addToCart(
          CartItem(
            image: item['image'],
            id: item.id,
            name: item['name'],
            price: item['price'],
            quantity: 1,
          ),
        );
        showSuccessSnackBar(
          '${item['name']} Successfully added to cart',
          context,
        );
      },
      child: Container(
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
      ),
    );
  }
}
