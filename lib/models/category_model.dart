// lib/models/category_model.dart
class Category {
  final String name;
  bool isSelected;

  Category({
    required this.name,
    this.isSelected = false,
  });
}