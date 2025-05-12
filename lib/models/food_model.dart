class Food {
  final String id;
  final String title;
  final String description;
  final double price;
  final String preparationTime;
  final List<String> types;
  final List<Additive> additives;
  final String imageUrl;

  Food({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.preparationTime,
    required this.types,
    required this.additives,
    required this.imageUrl,
  });
}

class Additive {
  final String id;
  final String title;
  final double price;

  Additive({
    required this.id,
    required this.title,
    required this.price,
  });
}