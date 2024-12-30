import 'package:flutter/material.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_elevated_button.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_text_form_field.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_typography.dart';
import 'package:provider_with_clean_architecture/core/utils/nef_spacing.dart';
import 'package:provider_with_clean_architecture/core/utils/string_util.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
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
    // Unfocus text fields when the page is loaded to avoid the keyboard being on
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Dismiss the keyboard when tapping outside of the text fields
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
                focusNode: _emailFocusNode, // Attach the FocusNode
              ),
              const SizedBox(height: NefSpacing.spacing4),
              NefTextFormField(
                hintText: passwordStr,
                controller: _passwordController,
                obscureText: true,
                focusNode: _passwordFocusNode, // Attach the FocusNode
              ),
              const SizedBox(height: NefSpacing.spacing4),
              // Sign-In Button
              NefElevatedButton(
                text: "Sign In",
                onPressed: _handleSignIn,
              ),
              const SizedBox(height: NefSpacing.spacing2),
              // Continue with Google Button
              NefGradientElevatedButton(
                label: "Continue with google",
                onPressed: () {},
              ),
              // Error Message
              if (errorMessage.isNotEmpty) ...[
                const SizedBox(height: NefSpacing.spacing4),
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
              const SizedBox(height: NefSpacing.spacing2),
              // Sign-Up Redirect
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      // Navigate to Sign Up page
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
