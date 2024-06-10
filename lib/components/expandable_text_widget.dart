import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  TextStyle? textStyle;
  final int maxLines;
  Widget? customButton;
  Function(bool isExpanded)? onShowMore;

  ExpandableTextWidget({
    super.key,
    required this.text,
    this.maxLines = 3,
    this.textStyle,
    this.customButton,
    this.onShowMore,
  });

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: isExpanded ? null : widget.maxLines,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: widget.textStyle,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
              widget.onShowMore!(isExpanded);
            });
          },
          child: widget.customButton ?? Text(
            isExpanded ? 'Show less' : 'Show more',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
