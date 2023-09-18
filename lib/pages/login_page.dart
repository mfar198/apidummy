import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apidummy/controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();

                  if (GetUtils.isEmail(email)) {
                    authController.login(email, password);
                  } else {
                    Get.snackbar(
                        'Invalid Email', 'Please enter a valid email address');
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
