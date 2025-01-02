import 'package:hive/hive.dart';

part 'user.g.dart'; // Required for code generation

@HiveType(typeId: 0) // Ensure the typeId is unique across all adapters
class User {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String bio;

  @HiveField(4)
  final String avatar;

  @HiveField(5)
  final String accessToken;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.bio,
    required this.avatar,
    required this.accessToken,
  });
}
