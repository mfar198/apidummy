import 'package:get/get.dart';
import 'package:apidummy/models/user_model.dart';
import 'package:apidummy/services/api_service.dart';

class UserController extends GetxController {
  final RxList<UserModel> userList = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await ApiService.getUserList();
    final List<dynamic> usersData = response['data'];
    userList.assignAll(usersData.map((data) => UserModel.fromJson(data)));
  }

  UserModel getUserById(int userId) {
    return userList.firstWhere((user) => user.id == userId);
  }
}
