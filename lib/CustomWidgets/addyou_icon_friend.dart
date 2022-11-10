import 'package:flutter/material.dart';

class AddYouIconFriend extends StatelessWidget {
  final Widget icon;
  final Widget? label;
  final EdgeInsets? padding, margin;

  const AddYouIconFriend({
    Key? key,
    required this.icon,
    this.label,
    this.padding,
    this.margin,
  }) : super(key: key);

  Widget _buildIcon() {
    return Container(
      padding: padding,
      margin: margin ?? const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIcon(),
        Visibility(
          visible: label != null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              label ?? Container(),
            ],
          ),
        ),
      ],
    );
  }
}
