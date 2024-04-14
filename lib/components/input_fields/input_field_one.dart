import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_beauty_hub/utils/color_schema.dart';
import 'package:my_beauty_hub/utils/constant.dart';

class InputFieldOne extends StatelessWidget {
  var textController = TextEditingController().obs;
  String? hint;
  String? lable;
  String? errorText;
  IconData? prefixIcon;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  bool isRequired;
  bool? activePassword;
  TextInputAction? textInputAction;
  bool? enabledBorder;
  EdgeInsetsGeometry? contentPadding;
  int? lines;

  InputFieldOne({
    super.key,
    required this.textController,
    this.hint,
    this.prefixIcon,
    this.lable,
    this.errorText,
    this.validator,
    this.keyboardType,
    required this.isRequired,
    this.activePassword,
    this.textInputAction,
    this.enabledBorder,
    this.contentPadding,
    this.lines
  });

  var isFieldValid = true.obs;
  final Rx<bool> _obscurePassword = Rx<bool>(true);

  void _togglePasswordVisibility() {
    _obscurePassword.value = !_obscurePassword.value;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Obx(
        () => TextFormField(
          controller: textController.value,
          textInputAction: textInputAction ?? TextInputAction.done,
          maxLines: lines ?? 1,
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              isFieldValid.value = false;
              return errorText ?? 'This field is required';
            } else {
              isFieldValid.value = true;
              return null;
            }
          },
          onChanged: (value) {
            if (isRequired && (value.isEmpty)) {
              isFieldValid.value = false;
            } else {
              isFieldValid.value = true;
            }
          },
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: activePassword == true ? _obscurePassword.value : false,
          cursorColor:
              isFieldValid.value ? Color(0xFF202020) : Color(0xFF202020),
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF202020),
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 12,
              color: secondaryTextColor,
              fontWeight: FontWeight.normal,
              fontFamily: 'Poppins',
            ),
            labelText: lable,
            labelStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xFF989898),
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            ),
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    size: 20,
                    color: secondaryTextColor,
                  )
                : null,
            suffixIcon: activePassword == true
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => InkWell(
                          onTap: _togglePasswordVisibility,
                          child: Container(
                            margin: const EdgeInsets.only(left: 0, right: 12),
                            padding: EdgeInsets.zero,
                            child: Icon(
                              _obscurePassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 18,
                              color: isFieldValid.value == true
                                  ? const Color(0xFF202020)
                                  : Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(),
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: contentPadding ?? const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF989898),
              ),
            ),
            enabledBorder: enabledBorder == true
                ? OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFEBF0FF),
                    ),
                    borderRadius: BorderRadius.circular(containerBorderRadius),
                  )
                : const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF989898),
                    ),
                  ),
            focusedBorder: enabledBorder == true
                ? OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFEBF0FF),
              ),
              borderRadius: BorderRadius.circular(containerBorderRadius),
            )
                : const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF989898),
              ),
            ),
            errorBorder: enabledBorder == true
                ? OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFEBF0FF),
              ),
              borderRadius: BorderRadius.circular(containerBorderRadius),
            )
                : const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF989898),
              ),
            ),
            focusedErrorBorder: enabledBorder == true
                ? OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFEBF0FF),
              ),
              borderRadius: BorderRadius.circular(containerBorderRadius),
            )
                :  const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF989898),
              ),
            ),
            errorText: errorText == null ? null : isFieldValid.value ? '' : errorText,
          ),
        ),
      ),
    );
  }
}
