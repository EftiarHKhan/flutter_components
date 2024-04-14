import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_beauty_hub/global_widgets/text_component.dart';
import 'package:my_beauty_hub/utils/color_schema.dart';
import 'package:my_beauty_hub/utils/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomDatePicker extends StatefulWidget {
  String? hint;
  IconData? prefixIcon;
  EdgeInsets? contentPadding;
  bool? enabledBorder;
  String? errorText;
  bool isRequired;
  CustomDatePicker({
    super.key,
    required this.isRequired,
    this.hint,
    this.prefixIcon,
    this.contentPadding,
    this.enabledBorder,
    this.errorText,
  });
  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  var isFieldValid = true.obs;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _presentDatePicker(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: Get.height * .7,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.zero,
              color: Colors.white,
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: CalendarDatePicker(
                    initialDate: _selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onDateChanged: (newDate) {
                      _selectedDate = newDate;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: TextComponent(
                        text: 'Cancel',
                        textColor: appYellowColor,
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    16.width,
                    TextButton(
                      onPressed: () {
                        _dateController.text =
                            "${_selectedDate.toLocal()}".split(' ')[0];
                        Navigator.of(context).pop();
                      },
                      child: TextComponent(
                        text: 'Done',
                        textColor: appYellowColor,
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      validator: (value) {
        if (widget.isRequired && (value == null || value.isEmpty)) {
          isFieldValid.value = false;
          return widget.errorText ?? 'This field is required';
        } else {
          isFieldValid.value = true;
          return null;
        }
      },
      onChanged: (value) {
        if (widget.isRequired && (value.isEmpty)) {
          isFieldValid.value = false;
        } else {
          isFieldValid.value = true;
        }
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(
          fontSize: 12,
          color: secondaryTextColor,
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins',
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                size: 20,
                color: secondaryTextColor,
              )
            : null,
        suffixIconConstraints: const BoxConstraints(),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF989898),
          ),
        ),
        enabledBorder: widget.enabledBorder == true
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
        focusedBorder: widget.enabledBorder == true
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
        errorBorder: widget.enabledBorder == true
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
        focusedErrorBorder: widget.enabledBorder == true
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
        errorText: widget.errorText == null
            ? null
            : isFieldValid.value
                ? ''
                : widget.errorText,
      ),
      readOnly: true,
      onTap: () => _presentDatePicker(context),
    );
  }
}
