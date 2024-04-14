import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_beauty_hub/utils/color_schema.dart';
import 'package:my_beauty_hub/utils/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class ButtonComponent extends StatelessWidget {

  IconData? icon;
  String? imagePath;
  String text;
  VoidCallback ontap;
  Color? buttonColor;
  Color? iconColor;
  Color? textColor;
  double? buttonHeight;
  double? buttonHeightSolid;
  double? buttonWidth;
  bool? activeOutline;
  double? textSize;
  FontWeight? fontWeight;
  Alignment? alignment;
  TextAlign? textAlignment;
  double? contentPaddingHorizontal;


  ButtonComponent({
    super.key,
    this.icon,
    this.imagePath,
    required this.text,
    required this.ontap,
    this.buttonColor,
    this.iconColor,
    this.textColor,
    this.buttonHeight,
    this.buttonHeightSolid,
    this.buttonWidth,
    this.activeOutline,
    this.textSize,
    this.fontWeight,
    this.alignment,
    this.textAlignment,
    this.contentPaddingHorizontal,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: contentPaddingHorizontal ?? 16),
        height: buttonHeightSolid != null ? buttonHeightSolid : Get.height * (buttonHeight ?? .06),
        width: buttonWidth,
        alignment: alignment,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(containerBorderRadius),
          color: activeOutline == true ? Colors.transparent :buttonColor ?? appButtonColor,
          border: Border.all(
            color: activeOutline == true ? buttonColor ?? appButtonColor : Colors.transparent,
          ),

        ),
        child: Row(
          mainAxisAlignment: imagePath != null ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            imagePath != null ? Image.asset(imagePath!) : Container(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon != null ? Icon(icon, size: 24, color: iconColor,) : Container(),
                  icon != null ? 4.width : Container(),
                  Text(text,
                    textAlign: textAlignment,
                    style: TextStyle(
                    color: textColor ?? (activeOutline == true ? appButtonColor : Colors.white),
                    fontSize: textSize ?? 14,
                    fontWeight: fontWeight ?? FontWeight.bold,
                    fontFamily: 'Poppins',

                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
