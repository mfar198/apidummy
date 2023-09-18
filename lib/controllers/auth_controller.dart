import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apidummy/services/api_service.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  Future<void> login(String email, String password) async {
    final response = await ApiService.loginUser(email, password);
    if (response.containsKey('token')) {
      isLoggedIn.value = true;
    } else {
      // Account not found, show error message
      Get.snackbar(
        'Login Failed',
        'Email or password does nit exists',
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );
    }
  }

  Future<void> register(String email, String password) async {
    final response = await ApiService.registerUser(email, password);
    if (response.containsKey('token')) {
      isLoggedIn.value = true;
    }
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
