import 'package:flutter/material.dart';

class NefPadding extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  /// Standardized padding values
  static const EdgeInsets defaultPadding = EdgeInsets.all(16);
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets bottomPadding = EdgeInsets.only(bottom: 16);

  const NefPadding({
    Key? key,
    required this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? defaultPadding,
      child: child,
    );
  }
}
