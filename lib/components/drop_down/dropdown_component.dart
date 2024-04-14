import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_beauty_hub/global_widgets/text_component.dart';
import 'package:my_beauty_hub/utils/color_schema.dart';
import 'package:my_beauty_hub/utils/constant.dart';
import 'package:nb_utils/nb_utils.dart';

class DropDownComponent extends StatelessWidget {
  final List<String> itemList;
  final void Function(String value) onSelectedItem;
  final String? hintText;
  final RxString selectedItem = ''.obs;

  DropDownComponent({
    Key? key,
    required this.itemList,
    required this.onSelectedItem,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? localSelectedItem;
    selectedItem.value = hintText ?? '';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(containerBorderRadius),
        border: Border.all(
          color: appBorderColor,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.female,
            color: secondaryTextColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return Dialog(
                          backgroundColor: Colors.white,
                          child: Container(
                            width: Get.width * .5,
                            padding: const EdgeInsets.symmetric(
                              vertical: 24,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Divider(
                                  color: Colors.black.withOpacity(.2),
                                  thickness: 1,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: itemList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (localSelectedItem ==
                                                itemList[index]) {
                                              localSelectedItem = hintText;
                                            } else {
                                              localSelectedItem =
                                                  itemList[index];
                                            }
                                          });
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 18,
                                                width: 18,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: localSelectedItem ==
                                                          itemList[index]
                                                      ? appYellowColor
                                                      : Colors.white,
                                                  border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(.8),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              TextComponent(
                                                text: itemList[index],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(.2),
                                  thickness: 1,
                                ),
                                8.height,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          localSelectedItem =
                                              selectedItem.value;
                                          Navigator.pop(context);
                                        },
                                        child: TextComponent(
                                          text: 'CANCEL',
                                          textColor: appYellowColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      InkWell(
                                        onTap: () {
                                          selectedItem.value =
                                              localSelectedItem ?? '';
                                          onSelectedItem(selectedItem.value);
                                          Navigator.pop(context);
                                        },
                                        child: TextComponent(
                                          text: 'OK',
                                          textColor: appYellowColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => TextComponent(
                        text: selectedItem.value != hintText
                            ? selectedItem.value
                            : hintText ?? '',
                        size: 14,
                        textColor: selectedItem.value != hintText
                            ? const Color(0xFF202020)
                            : secondaryTextColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                      )),
                  const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 20,
                    color: secondaryTextColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
