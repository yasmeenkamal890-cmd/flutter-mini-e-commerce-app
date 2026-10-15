class Product {
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final double price;
  final String category;
  final String imageUrl;
}
