import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_clean_architecture/core/utils/info_helper.dart';
import 'package:provider_with_clean_architecture/core/utils/loader.dart';
import 'package:provider_with_clean_architecture/core/utils/status_util.dart';
import 'package:provider_with_clean_architecture/core/utils/string_util.dart';
import 'package:provider_with_clean_architecture/ets/student/presentation/provider/student_provider.dart';
import 'package:provider_with_clean_architecture/ets/as/shared/custom_button.dart';
import 'package:provider_with_clean_architecture/ets/as/shared/custom_form.dart';
import 'package:provider_with_clean_architecture/ets/as/shared/custom_text.dart';

class StudentForm extends StatelessWidget {
  StudentForm({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<StudentProvider>(
          builder: (context, studentProvider, child) => Form(
              key: _formKey,
              child: Stack(
                children: [
                  userInterface(studentProvider),
                  loader(studentProvider, context)
                ],
              )),
        ),
      ),
    );
  }

  Widget loader(StudentProvider studentProvider, BuildContext context) {
    if (studentProvider.saveStudentStatus == StatusUtil.loading) {
      return Loader.backdropFilter(context);
    }
    return const SizedBox();
  }

  Widget userInterface(StudentProvider loginProvider) {
    return Column(
      children: [
        CustomText(
          text: studentFormStr,
        ),
        customSizedBox(),
        CustomTextFormField(
          labelText: nameStr,
          onChanged: (value) {
            loginProvider.name = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return nameErrorStr;
            }
            return null;
          },
        ),
        customSizedBox(),
        CustomTextFormField(
          labelText: addressStr,
          onChanged: (value) {
            loginProvider.address = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return addressErrorStr;
            }
            return null;
          },
        ),
        customSizedBox(),
        CustomTextFormField(
          labelText: contactErrorStr,
          onChanged: (value) {
            loginProvider.contact = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return contactErrorStr;
            }
            return null;
          },
        ),
        customSizedBox(),
        CustomTextFormField(
          labelText: genderErrorStr,
          onChanged: (value) {
            loginProvider.gender = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return genderErrorStr;
            }
            return null;
          },
        ),
        customSizedBox(),
        CustomButton(
          child: const Text(signUpButtonStr),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await loginProvider.saveStudent();
              handleResponse(loginProvider);
            }
          },
        )
      ],
    );
  }

  handleResponse(StudentProvider studentProvider) {
    if (studentProvider.saveStudentStatus == StatusUtil.success) {
      InfoHelper.showToast(successFullySignnedUp);
    } else if (studentProvider.saveStudentStatus == StatusUtil.error) {
      InfoHelper.showToast(studentProvider.errorMsg);
    }
  }

  customSizedBox() {
    return const SizedBox(
      height: 20,
    );
  }
}
