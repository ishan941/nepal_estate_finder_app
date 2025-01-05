import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_elevated_button.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_text_form_field.dart';
import 'package:provider_with_clean_architecture/core/utils/color_util.dart';
import 'package:provider_with_clean_architecture/core/utils/info_helper.dart';
import 'package:provider_with_clean_architecture/features/Auth/presentation/pages/login_page.dart';
import 'package:provider_with_clean_architecture/features/profile/data/model/model/user_model.dart';
import 'package:provider_with_clean_architecture/features/profile/presentation/notifier/user_notifier.dart';

class EditProfile extends ConsumerStatefulWidget {
  final String? userId;
  const EditProfile({required this.userId, super.key});

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  late UserModel editedUser;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await ref.read(userState.notifier).getUserData(widget.userId ?? "0");
    });
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userState);
    return userData.maybeWhen(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (message) => Scaffold(
        body: Center(child: Text(message ?? 'An error occurred')),
      ), // Error state
      success: (user) {
        editedUser = user;
        final avatar = user.avatar.isEmpty
            ? 'https://default-avatar-url.com'
            : user.avatar;
        final bio = user.bio.isEmpty ? 'No bio available' : user.bio;
        final email = user.email.isEmpty ? 'No email provided' : user.email;
        final username = user.username.isEmpty ? 'Anonymous' : user.username;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: const Text('Edit Profile'),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (Route<dynamic> route) => false,
                  );
                  // await ref
                  //     .read(userState.notifier)
                  //     .clearUserData(); // Clear user data
                },
              ),
            ],
          ),
          body: Padding(
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
                          ? Image.network(user.avatar, fit: BoxFit.cover)
                          : const Icon(Icons.account_circle, size: 100),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Username"),
                NefTextFormField(
                  initialValue: username,
                  onChanged: (value) {
                    editedUser = editedUser.copyWith(username: value);
                  },
                  decoration: const InputDecoration(labelText: "Username"),
                ),
                const Text("Email"),
                NefTextFormField(
                  initialValue: email,
                  onChanged: (value) {
                    editedUser = editedUser.copyWith(email: value);
                  },
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                const Text("Bio"),
                NefTextFormField(
                  initialValue: bio,
                  onChanged: (value) {
                    editedUser = editedUser.copyWith(bio: value);
                  },
                  decoration: const InputDecoration(labelText: "Bio"),
                ),
                const Text("Password"),
                const NefTextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                const SizedBox(height: 16),
                NefElevatedButton(
                  onPressed: () async {
                    final success = await ref
                        .read(userState.notifier)
                        .updateUser(widget.userId ?? "0", editedUser);
                    if (success) {
                      InfoHelper.showSuccessToast(
                          context, "Successfully updated");
                      Navigator.pop(context);
                    } else {
                      InfoHelper.showErrorToast(context, "failed");
                    }
                  },
                  text: 'Submit',
                ),
              ],
            ),
          ),
        );
      },
      orElse: () =>
          const SizedBox.shrink(), // Fallback if state is not recognized
    );
  }
}
