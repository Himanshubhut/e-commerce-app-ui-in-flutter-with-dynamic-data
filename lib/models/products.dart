// ignore: camel_case_types
class product {
  final int id;
  final String name;
  final String category;
  final String image;
  final String descripation;
  final double price;
  int quantity;

  product(
      {required this.id,
      required this.name,
      required this.category,
      required this.image,
      required this.descripation,
      required this.price,
      required this.quantity});
}
