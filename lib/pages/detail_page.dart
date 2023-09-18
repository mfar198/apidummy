import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:apidummy/controllers/user_controller.dart';

class DetailsPage extends StatelessWidget {
  final int userId;

  const DetailsPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final user = Get.find<UserController>().getUserById(userId);

    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 260.h,
            child: Image.network(
              'https://4kwallpapers.com/images/wallpapers/scenery-landscape-mountains-lake-evening-reflections-scenic-2048x1536-8821.jpg',
              fit: BoxFit.cover,
            ),
          ),
          scroll(),
        ],
      ),
    );
  }

  scroll() {
    final user = Get.find<UserController>().getUserById(userId);
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 1.0,
      minChildSize: 0.7,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(25),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.avatar),
                ),
                Text('Name: ${user.firstName} ${user.lastName}'),
                Text('Email: ${user.email}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
