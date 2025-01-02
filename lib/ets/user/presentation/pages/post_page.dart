import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_clean_architecture/core/utils/info_helper.dart';
import 'package:provider_with_clean_architecture/core/utils/status_util.dart';
import 'package:provider_with_clean_architecture/core/utils/string_util.dart';
import 'package:provider_with_clean_architecture/ets/as/shared/custom_button.dart';
import 'package:provider_with_clean_architecture/ets/as/shared/custom_form.dart';
import 'package:provider_with_clean_architecture/ets/user/presentation/provider/post_page_provider.dart';

class PostPage extends StatefulWidget {
  PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

final _formKey = GlobalKey<FormState>();

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Consumer<PostPageProvider>(
          builder: (context, postPageProvider, child) => Column(
            children: [
              CustomTextFormField(
                labelText: 'Floor',
                onChanged: (value) {
                  postPageProvider.floor = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return nameErrorStr;
                  }
                  return null;
                },
              ),
              CustomButton(
                child: const Text(signUpButtonStr),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await postPageProvider.postPageData();
                    handleResponse(postPageProvider);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  handleResponse(PostPageProvider postPageProvider) {
    if (postPageProvider.postPageUtil == StatusUtil.success) {
      InfoHelper.showToast(successFullySignnedUp);
    } else if (postPageProvider.postPageUtil == StatusUtil.error) {
      InfoHelper.showToast(postPageProvider.errormsg);
    }
  }
}
