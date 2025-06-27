import 'package:get/get.dart';
import '../models/additive_model.dart';
import '../models/category_model.dart';
import '../models/food_model.dart';

class FoodController extends GetxController {
  // Reactive lists
  final RxList<Food> foods = <Food>[].obs;
  final RxList<Additive> tempAdditives = <Additive>[].obs;
  final RxList<String> tempImages = <String>[].obs;
  final RxList<Category> categories = <Category>[].obs;
  final RxList<String> foodTypes = <String>[].obs; // Moved to top level
  
  // Current food being edited
  Food? tempFood;

  @override
  void onInit() {
    super.onInit();
    initializeDemoData();
  }

  void initializeDemoData() {
    // Initialize categories
    categories.addAll([
      Category(name: 'Fried Rice', isSelected: false),
      Category(name: 'Curry', isSelected: false),
      Category(name: 'Pizza', isSelected: false),
      Category(name: 'Pasta', isSelected: false),
      Category(name: 'Beverages', isSelected: false),
      Category(name: 'Burgers', isSelected: false),
      Category(name: 'Chicken', isSelected: false),
      Category(name: 'More', isSelected: false),
    ]);

    // Initialize demo foods
    foods.addAll([
      Food(
        id: '1',
        title: 'Tromaku',
        description: 'Leningumi Gollah Mustapien Chaste Goods Sugar',
        preparationTime: '56 min',
        price: 17.10,
        categories: ['Curry'],
        additives: [],
        images: ['https://example.com/image1.jpg'],
        status: 'Available',
        imageUrl: 'https://example.com/image1.jpg',
        types: ['Lunch'], // Added example type
      ),
      Food(
        id: '2',
        title: 'Spaghetti Carbonaro',
        description: 'Fog Anseldo Rennison Chasse Black Paper Arms',
        preparationTime: '20 min',
        price: 31.10,
        categories: ['Pasta'],
        additives: [],
        images: ['https://example.com/image2.jpg'],
        status: 'Available',
        imageUrl: 'https://example.com/image2.jpg',
        types: ['Dinner'], // Added example type
      ),
    ]);
  }

  // Food type management
  void addFoodType(String type) {
    if (type.isNotEmpty && !foodTypes.contains(type)) {
      foodTypes.add(type);
    }
  }

  void removeFoodType(String type) {
    foodTypes.remove(type);
  }

  // Initialize new food creation
  void startNewFood() {
    tempFood = Food(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: '',
      description: '',
      preparationTime: '',
      price: 0,
      categories: [],
      additives: [],
      images: [],
      status: 'New',
      imageUrl: '',
      types: [],
    );
    tempAdditives.clear();
    tempImages.clear();
    foodTypes.clear(); // Clear previous types
    resetCategorySelection();
  }

  void resetCategorySelection() {
    for (var category in categories) {
      category.isSelected = false;
    }
    categories.refresh();
  }

  // Save the temporary food to the main list
  // Updated saveFood method in food_controller.dart
void saveFood({
  String? title,
  String? description,
  String? preparationTime,
  double? price,
}) {
  if (tempFood != null) {
    final newFood = tempFood!.copyWith(
      title: title ?? tempFood!.title,
      description: description ?? tempFood!.description,
      preparationTime: preparationTime ?? tempFood!.preparationTime,
      price: price ?? tempFood!.price,
      categories: getSelectedCategories(),
      additives: getAdditiveNames(),
      images: tempImages,
      imageUrl: tempImages.isNotEmpty ? tempImages.first : '',
      types: foodTypes.toList(),
    );
    
    foods.add(newFood);
    resetTempData();
  }
}

  List<String> getSelectedCategories() {
    return categories
        .where((category) => category.isSelected)
        .map((category) => category.name)
        .toList();
  }

  List<String> getAdditiveNames() {
    return tempAdditives.map((a) => a.title).toList();
  }

  void resetTempData() {
    tempFood = null;
    tempAdditives.clear();
    tempImages.clear();
    foodTypes.clear();
  }

  // Add food directly (for testing/demo purposes)
  void addFood(Food newFood) {
    foods.add(newFood);
  }
}