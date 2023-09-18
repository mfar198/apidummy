import 'package:apidummy/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apidummy/controllers/user_controller.dart';

class ListPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: Obx(() {
        if (userController.userList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: userController.userList.length,
          itemBuilder: (context, index) {
            final user = userController.userList[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => DetailsPage(userId: user.id));
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email),
              ),
            );
          },
        );
      }),
    );
  }
}
