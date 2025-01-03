import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/features/Auth/domain/service/user_hive_service.dart';
import 'package:provider_with_clean_architecture/features/Auth/data/model/hive/user.dart';

class UserHiveNotifier extends StateNotifier<User?> {
  final UserHiveService hiveService;

  UserHiveNotifier(this.hiveService) : super(null);

  // Fetch user data from Hive
  // Future<void> fetchUserData() async {
  //   state = await hiveService.getUserFromHive();
  // }

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

  Future<void> fetchUserData() async {
    final user = await hiveService.getUserFromHive();
    if (user != null) {
      print("User fetched from Hive: $user");
    } else {
      print("No user found in Hive.");
    }
    state = user;
  }
}

final userProvider = StateNotifierProvider<UserHiveNotifier, User?>(
  (ref) => UserHiveNotifier(UserHiveService()),
);
