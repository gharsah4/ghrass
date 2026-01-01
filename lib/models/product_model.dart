class ProductModel {
  final String id;
  final String name;
  final String image;
  final double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  factory ProductModel.fromFirestore(Map<String, dynamic> data, String id) {
    return ProductModel(
      id: id,
      name: data['name'],
      image: data['image'],
      price: (data['price'] as num).toDouble(),
    );
  }
}
