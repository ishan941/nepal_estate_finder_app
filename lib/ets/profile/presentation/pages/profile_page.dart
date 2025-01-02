import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/utils/color_util.dart';
import 'package:provider_with_clean_architecture/features/login/presentation/pages/login_page.dart';

import 'package:provider_with_clean_architecture/features/login/presentation/provider/user_notifier.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await ref.read(userProvider.notifier).fetchUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Profile Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              Navigator.pushAndRemoveUntil(
                  context,
                  (MaterialPageRoute(builder: (context) => const LoginPage())),
                  (Route<dynamic> route) => false);
              await ref.read(userProvider.notifier).clearUserData();
            },
          ),
        ],
      ),
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipOval(
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: user.avatar.isNotEmpty
                            ? Image.network(
                                user.avatar,
                                fit: BoxFit.cover,
                              )
                            : const Icon(Icons.account_circle, size: 100),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text("${user.username}"),
                  Text("${user.email}"),
                  Text("Bio: ${user.bio}"),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Edit Profile"),
                  ),
                ],
              ),
            ),
    );
  }
}
