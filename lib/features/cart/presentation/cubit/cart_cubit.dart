import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reco_task/features/cart/data/models/cart_item.dart';
import 'package:reco_task/features/cart/presentation/cubit/cart_states.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<CartItem> _cart = [];

  void addToCart(CartItem item) {
    final index = _cart.indexWhere((element) => element.id == item.id);
    if (index == -1) {
      _cart.add(item);
    } else {
      final existing = _cart[index];
      _cart[index] = existing.copyWith(quantity: existing.quantity + item.quantity);
    }
    emit(CartUpdated(List.from(_cart)));
  }

  void removeFromCart(String id) {
    _cart.removeWhere((item) => item.id == id);
    emit(CartUpdated(List.from(_cart)));
  }

  void updateQuantity(String id, int quantity) {
    final index = _cart.indexWhere((item) => item.id == id);
    if (index != -1 && quantity > 0) {
      _cart[index] = _cart[index].copyWith(quantity: quantity);
      emit(CartUpdated(List.from(_cart)));
    }
  }

  void clearCart() {
    _cart.clear();
    emit(CartUpdated([]));
  }
}
