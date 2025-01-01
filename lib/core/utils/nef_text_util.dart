import 'package:flutter/material.dart';

class NefTextUtil extends StatelessWidget {
  String? text;
  Color? textColor;
  Color? decorationColor;
  bool? softWrap;
  double? fontSize;
  int? maxline;
  TextAlign? textAlign;
  TextDecoration? decoration;
  FontStyle? fontStyle;
  TextOverflow? overflow;
  FontWeight? fontWeight;
  double paddingLeft, paddingRight, paddingTop, paddingBottom;
  NefTextUtil(
      {super.key,
      this.maxline,
      this.paddingBottom = 0.0,
      this.paddingLeft = 0.0,
      this.paddingRight = 0.0,
      this.paddingTop = 0.0,
      this.text,
      this.overflow,
      this.textAlign,
      this.fontWeight,
      this.fontStyle,
      this.decorationColor,
      this.textColor,
      this.fontSize,
      this.decoration,
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
            decoration: decoration,
            decorationColor: decorationColor,
            overflow: overflow,
            fontWeight: fontWeight ?? FontWeight.normal,
            fontStyle: fontStyle ?? FontStyle.normal),
      ),
    );
  }
}
