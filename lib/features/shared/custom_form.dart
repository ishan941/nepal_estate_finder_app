import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  String? labelText;
  String? hintText;
  List<TextInputFormatter>? inputFormatter;
  bool obsecureText;
  String? initialValue;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  Widget? suffixIcon;
  bool isVisible;
  bool readOnly;
  Widget? prefixIcon;
  TextEditingController? controller;
  Function()? onTap;
  bool smallTextFormField;
  Function(String)? onChanged;

  CustomTextFormField(
      {Key? key,
      this.smallTextFormField = false,
      this.isVisible = false,
      this.onChanged,
      this.labelText,
      this.onTap,
      this.readOnly = false,
      this.obsecureText = false,
      this.hintText,
      this.inputFormatter,
      this.keyboardType,
      this.validator,
      this.suffixIcon,
      this.initialValue,
      this.controller,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: readOnly,
          onTap: onTap,
          onChanged: onChanged,
          controller: controller,
          initialValue: initialValue ?? "",
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
              labelText: labelText,
              filled: true,
              fillColor: Colors.white,
              contentPadding: smallTextFormField
                  ? const EdgeInsets.fromLTRB(0.0, 10, 8.0, 40.0)
                  : const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              prefixIcon: prefixIcon,
              prefixIconConstraints: const BoxConstraints(minWidth: 40.0),
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 14),
              suffixIcon: suffixIcon,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
          obscureText: obsecureText,
          keyboardType: keyboardType,
          inputFormatters: inputFormatter,
          validator: validator,
        ),
      ),
    );
  }
}
