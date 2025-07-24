import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reco_task/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:reco_task/features/cart/presentation/cubit/cart_states.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartCubit>().state;

    if (cartState is CartUpdated && cartState.items.isNotEmpty) {
      final items = cartState.items;

      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, index) {
                final item = items[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🖼️ Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            item.image,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.image_not_supported),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // 📄 Info + Buttons
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Price: \$${item.price}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text("Qty: ${item.quantity}"),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      context.read<CartCubit>().updateQuantity(
                                        item.id,
                                        item.quantity + 1,
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      if (item.quantity > 1) {
                                        context
                                            .read<CartCubit>()
                                            .updateQuantity(
                                              item.id,
                                              item.quantity - 1,
                                            );
                                      } else {
                                        context
                                            .read<CartCubit>()
                                            .removeFromCart(item.id);
                                      }
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      context.read<CartCubit>().removeFromCart(
                                        item.id,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              Text(
                "Total: \$${cartState.total.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  context.read<CartCubit>().clearCart();
                },
                child: Container(
                  width: 200,
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
                        child: Text(
                          'clear cart',
                          style: GoogleFonts.getFont(
                            'Lato',
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return const Center(child: Text("Your cart is empty."));
    }
  }
}
