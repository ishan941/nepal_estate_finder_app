import 'package:hive/hive.dart';
import 'package:provider_with_clean_architecture/features/Auth/data/model/auth_model/auth_model.dart';
import 'package:provider_with_clean_architecture/features/Auth/data/model/hive/user.dart';

class UserHiveService {
  static const String userBoxName = 'userBox';

  Future<void> saveUserToHive(User user) async {
    final box = await Hive.openBox<User>(userBoxName);
    await box.put('currentUser', user);
  }

  Future<User?> getUserFromHive() async {
    final box = await Hive.openBox<User>(userBoxName);
    return box.get('currentUser');
  }

  Future<void> clearUserData() async {
    final box = await Hive.openBox<User>(userBoxName);
    await box.clear();
  }
}

extension AuthModelToUser on AuthModel {
  User toHiveUser() {
    final user = User(
      id: id ?? '',
      username: username ?? '',
      email: email ?? '',
      bio: bio ?? '',
      avatar: avatar ?? '',
      accessToken: accessToken ?? '',
    );
    print("Converted AuthModel to User: $user");
    return user;
  }
}
