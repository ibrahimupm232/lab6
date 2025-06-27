class Food {
  final String id;
  final String title;
  final String description;
  final String preparationTime;
  final double price;
  final List<String> categories;
  final List<String> additives;
  final List<String> images;
  final String status;
  final String imageUrl;
  final List<String> types;  // Add this line

  Food({
    required this.id,
    required this.title,
    required this.description,
    required this.preparationTime,
    required this.price,
    required this.categories,
    required this.additives,
    required this.images,
    required this.status,
    required this.imageUrl,
    required this.types,  // Add this to constructor
  });

  Food copyWith({
    String? id,
    String? title,
    String? description,
    String? preparationTime,
    double? price,
    List<String>? categories,
    List<String>? additives,
    List<String>? images,
    String? status,
    String? imageUrl,
    List<String>? types,
  }) {
    return Food(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      preparationTime: preparationTime ?? this.preparationTime,
      price: price ?? this.price,
      categories: categories ?? this.categories,
      additives: additives ?? this.additives,
      images: images ?? this.images,
      status: status ?? this.status,
      imageUrl: imageUrl ?? this.imageUrl,
      types: types ?? this.types,
    );
  }
}