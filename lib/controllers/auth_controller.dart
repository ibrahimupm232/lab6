import 'package:get/get.dart';

class AuthController extends GetxController {
  final RxBool isLoggedIn = false.obs;
  final RxString username = ''.obs;
  final RxString email = ''.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize any necessary data
  }

  void login(String email, String password) {
    try {
      if (email.isEmpty || password.isEmpty) {
        throw Exception('Please enter both email and password');
      }

      // Simulate successful login
      isLoggedIn.value = true;
      this.email.value = email;
      errorMessage.value = '';
      //Get.offAllNamed('/home');
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Login Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void register(String username, String email, String password) {
    try {
      if (username.isEmpty || email.isEmpty || password.isEmpty) {
        throw Exception('Please fill all fields');
      }
      if (password.length < 6) {
        throw Exception('Password must be at least 6 characters');
      }

      // Simulate successful registration
      this.username.value = username;
      this.email.value = email;
      isLoggedIn.value = true;
      errorMessage.value = '';
      Get.offAllNamed('/home');
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar(
        'Registration Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void logout() {
    isLoggedIn.value = false;
    username.value = '';
    email.value = '';
    Get.offAllNamed('/login');
  }
}