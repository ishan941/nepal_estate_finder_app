import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_elevated_button.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_nav_bar.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_text_form_field.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_typography.dart';
import 'package:provider_with_clean_architecture/core/utils/info_helper.dart';
import 'package:provider_with_clean_architecture/core/utils/nef_spacing.dart';
import 'package:provider_with_clean_architecture/core/utils/string_util.dart';
import 'package:provider_with_clean_architecture/features/Auth/data/model/auth_state/auth_state.dart';
import 'package:provider_with_clean_architecture/features/Auth/presentation/pages/sign_up_page.dart';
import 'package:provider_with_clean_architecture/features/Auth/presentation/provider/auth_notifier.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.watch(authProvider.notifier);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: NefPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                signInStr,
                style: NefTypography.headline2,
              ),
              const SizedBox(height: NefSpacing.spacing4),
              NefTextFormField(
                hintText: emailStr,
                controller: _emailController,
                focusNode: _emailFocusNode,
              ),
              NefTextFormField(
                hintText: passwordStr,
                controller: _passwordController,
                obscureText: true,
                focusNode: _passwordFocusNode,
              ),
              Row(
                children: [
                  Checkbox(
                      value: authState.rememberMe,
                      onChanged: (bool? value) {
                        authNotifier.toggleRememberMe(value ?? false);
                      }),
                  Text("Remember Me"),
                ],
              ),
              const SizedBox(height: NefSpacing.spacing2),
              NefElevatedButton(
                text: "Sign In",
                onPressed: _handleSignIn,
              ),
              NefGradientElevatedButton(
                  onPressed: () {}, label: "CONTINUE WITH GOOGLE"),
              if (authState is Loading) ...[
                const SizedBox(height: NefSpacing.spacing2),
                const CircularProgressIndicator(),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _showError(context, 'Please fill in both fields.');
      return;
    }

    await ref.read(authProvider.notifier).login(email, password);
    final authState = ref.read(authProvider);

    if (authState is Authenticated) {
      InfoHelper.showSuccessToast(context, "successfully login");
      Navigator.pushAndRemoveUntil(
          context,
          (MaterialPageRoute(builder: (context) => const NefNavBar())),
          (Route<dynamic> route) => false);
    } else if (authState is Error) {
      InfoHelper.showSuccessToast(context, "Failed login");
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message, style: const TextStyle(color: Colors.red))),
    );
  }
}
