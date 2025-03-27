import 'package:flutter/material.dart';

import 'constants/constants.dart';

class BottomBarActiveItem extends StatelessWidget {
  const BottomBarActiveItem(
    this.index, {
    required this.itemWidget,
    required this.onTap,
    required this.scrollPosition,
    required this.kIconSize,
    required this.showLabel,
    this.label,
    this.activeLabelStyle,
    this.labelWidget,
    this.maxLine,
    this.textOverflow,
    this.textAlign,
    this.textDirection,
  });

  /// item index
  final int index;

  final double kIconSize;

  /// item
  final Widget itemWidget;

  /// Double value to indicate the item position
  final double scrollPosition;

  /// String to indicate the label item
  final Widget? labelWidget;

  /// String to indicate the label item
  final String? label;

  /// Boolean to show the item label
  final bool showLabel;

  /// Value to indicate the label Style
  final TextStyle? activeLabelStyle;

  /// set the maxLine of item label
  final int? maxLine;

  /// to handle the overflow of the item label
  final TextOverflow? textOverflow;

  /// textAlign to align the label text
  final TextAlign? textAlign;

  /// set the textDirection of item label
  final TextDirection? textDirection;

  /// Function called when an item was tapped
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final icon = itemWidget;
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox.fromSize(
            size: Size(kIconSize+30, kIconSize+10),
            child: Center(
              child: Opacity(
                  opacity: kPi * 2 * (scrollPosition % 1) == 0 ? 1 : 0,
                  child: Container(width: 800, height: 2225, child: Stack(children: [Positioned(child: icon, left: 20,)]))),
            ),
          ),
          if (labelWidget != null || (label != null && showLabel)) ...[
            const SizedBox(height: 20.0),
            Container(
              width: 80,
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [Positioned(
                  bottom: 23,
                  right: 15,
                  left: 0,
                  child: labelWidget ??
                      Text(
                        label!,
                        maxLines: maxLine ?? 1,
                        overflow: textOverflow ?? TextOverflow.visible,
                        textAlign: textAlign,
                        textDirection: textDirection,
                        style: activeLabelStyle ??
                            TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12.0,
                            ),
                      ),
                ),]
              ),
            ),
          ],
        ],
      ),
      onTap: () => onTap(index),
    );
  }
}
