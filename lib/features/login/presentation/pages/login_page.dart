import 'package:flutter/material.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_elevated_button.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_text_form_field.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_typography.dart';
import 'package:provider_with_clean_architecture/core/utils/nef_spacing.dart';
import 'package:provider_with_clean_architecture/core/utils/string_util.dart';
import 'package:provider_with_clean_architecture/features/login/presentation/pages/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = '';

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void _handleSignIn() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = 'Please fill in both fields.';
      });
      return;
    }

    if (email == 'test@example.com' && password == 'password') {
      setState(() {
        errorMessage = '';
      });
    } else {
      setState(() {
        errorMessage = 'Invalid credentials.';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
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
              const SizedBox(height: NefSpacing.spacing2),
              NefElevatedButton(
                text: "Sign In",
                onPressed: _handleSignIn,
              ),
              NefGradientElevatedButton(
                label: "Continue with google",
                onPressed: () {},
              ),
              if (errorMessage.isNotEmpty) ...[
                const SizedBox(height: NefSpacing.spacing4),
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
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
}
