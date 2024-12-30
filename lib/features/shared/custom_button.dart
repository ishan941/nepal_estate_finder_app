import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function()? onPressed;
  double? height;
  Color? primary;
  Color? onPrimary;
  double? paddingAll;
  double? borderRadius;
  double? fontSize;
  double? width;
  Widget? child;
  CustomButton(
      {Key? key,
      this.height,
      this.child,
      this.paddingAll,
      this.onPrimary,
      this.onPressed,
      this.borderRadius,
      this.primary,
      this.fontSize,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingAll ?? 10.0),
      child: Center(
        child: Container(
          height: height ?? 45,
          width: width ?? MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 14)),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primary ?? Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 14))),
              onPressed: onPressed,
              child: child),
        ),
      ),
    );
  }
}
