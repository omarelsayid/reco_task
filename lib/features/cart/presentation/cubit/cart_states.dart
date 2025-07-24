import 'package:reco_task/features/cart/data/models/cart_item.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<CartItem> items;

  CartUpdated(this.items);

  double get total => items.fold(0, (sum, item) {
    final double price = double.tryParse(item.price) ?? 0;
    final int quantity = item.quantity;

    return sum + price * quantity;
  });
}
