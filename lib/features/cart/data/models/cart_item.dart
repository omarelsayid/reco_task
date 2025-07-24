class CartItem {
  final String id;
  final String name;
  final String price;
  final String image;
  final int quantity;

  CartItem({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      image: image,
      id: id,
      name: name,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }
}
