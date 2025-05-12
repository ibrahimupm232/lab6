import 'package:get/get.dart';
import '../models/food_model.dart';

class FoodController extends GetxController {
  final RxList<Food> foods = <Food>[].obs;
  final RxList<String> categories = <String>[
    'Burgers',
    'Pizzas',
    'Drinks',
    'Desserts'
  ].obs;

  void addFood(Food food) {
    foods.add(food);
  }

  void removeFood(String id) {
    foods.removeWhere((food) => food.id == id);
  }
}