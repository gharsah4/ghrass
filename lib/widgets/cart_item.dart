class CartItems {
  final String name;
  final String image;
  final double price;
  int quantity;

  CartItems({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
    'price': price,
    'quantity': quantity,
  };

  factory CartItems.fromJson(Map<String, dynamic> json) => CartItems(
    name: json['name'],
    image: json['image'],
    price: (json['price'] as num).toDouble(),
    quantity: json['quantity'] ?? 1,
  );
}
