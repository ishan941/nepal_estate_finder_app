import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_app_bar.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_elevated_button.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_text_form_field.dart';
import 'package:provider_with_clean_architecture/core/utils/nef_spacing.dart';
import 'package:provider_with_clean_architecture/features/profile/data/model/model/user_model.dart';
import 'package:provider_with_clean_architecture/features/profile/presentation/notifier/user_notifier.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      fetchUserData();
    });
  }

  void fetchUserData() {
    ref.read(userState.notifier).getUserData();
  }

  void populateFields(UserModel user) {
    _usernameController.text = user.username;
    _emailController.text = user.email;
    _bioController.text = user.bio;
  }

  @override
  Widget build(BuildContext context) {
    final userStateValue = ref.read(userState);

    return Scaffold(
      appBar: NefAppBar(title: "Profile Page"),
      body: userStateValue.maybeWhen(
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (user) {
          if (user != null) populateFields(user);
          return _buildProfileForm();
        },
        error: (error) => Center(child: Text(error ?? "Unknown Error")),
        orElse: () => _buildProfileForm(),
      ),
    );
  }

  Widget _buildProfileForm() {
    return SingleChildScrollView(
      child: NefPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipOval(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    "assets/images/avatar.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: NefSpacing.spacing4),
            const Text("Username"),
            const SizedBox(height: NefSpacing.spacing2),
            NefTextFormField(
              controller: _usernameController,
            ),
            const Text("Email"),
            const SizedBox(height: NefSpacing.spacing2),
            NefTextFormField(
              controller: _emailController,
            ),
            const Text("Bio"),
            const SizedBox(height: NefSpacing.spacing2),
            NefTextFormField(
              controller: _bioController,
            ),
            const Text("Password"),
            const SizedBox(height: NefSpacing.spacing2),
            NefTextFormField(
              controller: _passwordController,
              obscureText: true,
            ),
            NefElevatedButton(
              backgroundColor: Colors.blue.shade700,
              text: "Submit",
              onPressed: () {
                // Handle submit
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    super.dispose();
  }
}
