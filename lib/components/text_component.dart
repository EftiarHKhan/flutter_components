import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {

  String text;
  TextAlign? textAlign;
  Color? textColor;
  double? size;
  FontWeight? fontWeight;
  TextOverflow? textOverflow;
  int? maxLine;
  TextDecoration? textDecoration;
  String? fontFamily;
  double? height;

  TextComponent({super.key,
    required this.text,
    this.textAlign,
    this.textColor,
    this.size,
    this.fontWeight,
    this.textOverflow,
    this.maxLine,
    this.textDecoration,
    this.fontFamily,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaleFactor: 1,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: size,
          fontWeight: fontWeight,
          overflow: textOverflow,
          decoration: textDecoration,
          fontFamily: fontFamily ?? 'Poppins',
          height: height,
        letterSpacing: 0,
      ),
    );
  }
}
