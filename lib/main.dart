import 'package:apidummy/pages/list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:apidummy/controllers/auth_controller.dart';
import 'package:apidummy/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, _) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Get Project',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Obx(() {
          if (authController.isLoggedIn.value) {
            // User is logged in, show ListPage
            return ListPage();
          } else {
            // User is not logged in, show LoginPage
            return LoginPage();
          }
        }),
      ),
    );
  }
}
