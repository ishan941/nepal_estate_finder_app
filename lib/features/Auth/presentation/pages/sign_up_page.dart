import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_elevated_button.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_text_form_field.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_typography.dart';
import 'package:provider_with_clean_architecture/core/utils/nef_spacing.dart';
import 'package:provider_with_clean_architecture/features/Auth/presentation/pages/login_page.dart';
import 'package:provider_with_clean_architecture/features/Auth/presentation/provider/auth_notifier.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _userNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _handleSignUp() async {
    final email = _emailController.text;
    final username = _userNameController.text;
    final password = _passwordController.text;

    if (email.isEmpty || username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    try {
      await ref
          .read(authProvider.notifier)
          .signUpUser(username, email, password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signed up successfully!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: NefPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
                style: NefTypography.headline2,
              ),
              const SizedBox(height: NefSpacing.spacing4),
              NefTextFormField(
                hintText: 'Username',
                controller: _userNameController,
                focusNode: _userNameFocusNode,
              ),
              NefTextFormField(
                hintText: 'Email',
                controller: _emailController,
                focusNode: _emailFocusNode,
              ),
              NefTextFormField(
                hintText: 'Password',
                controller: _passwordController,
                obscureText: true,
                focusNode: _passwordFocusNode,
              ),
              const SizedBox(height: NefSpacing.spacing2),
              NefElevatedButton(
                text: authState.maybeWhen(
                  // loading: () => 'Signing Up...',
                  orElse: () => 'Sign Up',
                ),
                onPressed: _handleSignUp,
                // authState.maybeWhen(loading: () => null, orElse: _handleSignUp),
              ),
              const SizedBox(height: NefSpacing.spacing4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      'Sign In',
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
}
