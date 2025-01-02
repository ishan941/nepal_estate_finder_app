import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/features/login/domain/service/user_hive_service.dart';
import 'package:provider_with_clean_architecture/features/login/data/model/hive/user.dart';

class UserNotifier extends StateNotifier<User?> {
  final UserHiveService hiveService;

  UserNotifier(this.hiveService) : super(null);

  // Fetch user data from Hive
  Future<void> fetchUserData() async {
    state = await hiveService.getUserFromHive();
  }

  // Save user data to Hive
  Future<void> saveUserData(User user) async {
    await hiveService.saveUserToHive(user);
    state = user;
  }

  // Clear user data from Hive
  Future<void> clearUserData() async {
    await hiveService.clearUserData();
    state = null;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User?>(
  (ref) => UserNotifier(UserHiveService()),
);
