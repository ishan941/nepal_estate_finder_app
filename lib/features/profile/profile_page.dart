import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_app_bar.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_elevated_button.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_text_form_field.dart';
import 'package:provider_with_clean_architecture/core/utils/color_util.dart';
import 'package:provider_with_clean_architecture/core/utils/nef_spacing.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

final FocusNode _emailFocusNode = FocusNode();
final FocusNode _passwordFocusNode = FocusNode();
final FocusNode _usernameFocusNode = FocusNode();
final FocusNode _bio = FocusNode();

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NefAppBar(title: "Profile Page"),
      body: SingleChildScrollView(
        child: NefPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipOval(
                    child: Container(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          "assets/images/avatar.jpg",
                          fit: BoxFit.cover,
                        ))),
              ),
              const Text("Ishan Shrestha"),
              const Text("ishan@gmail.com"),
              SizedBox(height: NefSpacing.spacing4),
              Text("Username"),
              SizedBox(height: NefSpacing.spacing2),
              NefTextFormField(
                focusNode: _usernameFocusNode,
              ),
              Text("Email"),
              SizedBox(height: NefSpacing.spacing2),
              NefTextFormField(focusNode: _emailFocusNode),
              Text("Bio"),
              SizedBox(height: NefSpacing.spacing2),
              NefTextFormField(focusNode: _bio),
              Text("Password"),
              SizedBox(height: NefSpacing.spacing2),
              NefTextFormField(focusNode: _passwordFocusNode),
              NefElevatedButton(
                  backgroundColor: Colors.blue.shade700,
                  text: "Submit",
                  onPressed: () {}),
              NefElevatedButton(
                  backgroundColor: Colors.green.shade700,
                  text: "Create Listing",
                  onPressed: () {}),
              Row(
                children: [Text("Delete Account"), Spacer(), Text("Sign out")],
              )
            ],
          ),
        ),
      ),
    ); // Your UI here
  }
}
