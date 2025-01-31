import 'package:flutter/material.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/utils/color_util.dart';
import 'package:provider_with_clean_architecture/core/utils/nef_spacing.dart';

class NefTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? initialValue;

  const NefTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.validator,
    this.onChanged,
    this.initialValue,
    FocusNode? focusNode,
    InputDecoration? decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: NefPadding.bottomPadding,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(NefSpacing.spacing2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(NefSpacing.spacing2),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(NefSpacing.spacing2),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

class NefSearchTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onClearPressed;
  final Widget? prefixIcon;

  const NefSearchTextForm({
    Key? key,
    required this.controller,
    this.hintText = 'Search...',
    this.onChanged,
    this.onSearchPressed,
    this.onClearPressed,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: NefSpacing.spacing11,
      child: TextFormField(
        // cursorColor: primaryColor,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: grey300),
          contentPadding: const EdgeInsets.symmetric(
              vertical: NefSpacing.spacing2, horizontal: NefSpacing.spacing4),
          prefixIcon: prefixIcon,
          suffixIcon: controller.text.isNotEmpty
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        controller.clear();
                        if (onClearPressed != null) {
                          onClearPressed!();
                        }
                      },
                    ),
                  ],
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(NefRadius.radius1),
            borderSide:
                const BorderSide(color: grey300, style: BorderStyle.solid),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(NefRadius.radius1),
            borderSide: const BorderSide(color: grey300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(NefRadius.radius1),
            borderSide: const BorderSide(color: grey300),
          ),
          filled: false,
          fillColor: whiteColor,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
