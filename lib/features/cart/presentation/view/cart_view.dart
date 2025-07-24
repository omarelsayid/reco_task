import 'package:flutter/material.dart';
import 'package:reco_task/features/cart/presentation/view/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CartViewBody(),
    );
  }
}
