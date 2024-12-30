import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  Color? textColor;
  bool? softWrap;
  double? fontSize;
  int? maxline;

  TextAlign? textAlign;
  FontStyle? fontStyle;
  FontWeight? fontWeight;
  double paddingLeft, paddingRight, paddingTop, paddingBottom;
  CustomText(
      {super.key,
      this.maxline,
      this.paddingBottom = 0.0,
      this.paddingLeft = 0.0,
      this.paddingRight = 0.0,
      this.paddingTop = 0.0,
      this.text,
      this.textAlign,
      this.fontWeight,
      this.fontStyle,
      this.textColor,
      this.fontSize,
      this.softWrap = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          paddingLeft, paddingTop, paddingRight, paddingBottom),
      child: Text(
        text ?? "",
        maxLines: maxline ?? 2,
        textAlign: textAlign ?? TextAlign.left,
        softWrap: softWrap,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: fontSize ?? 14,
            fontWeight: fontWeight ?? FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.normal),
      ),
    );
  }
}
