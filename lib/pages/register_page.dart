import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apidummy/controllers/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  final AuthController authController = Get.find();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authController.register("eve.holt@reqres.in", "pistol");
          },
          child: const Text('Register'),
        ),
      ),
    );
  }
}
