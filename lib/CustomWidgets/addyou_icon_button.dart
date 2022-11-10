import 'package:flutter/material.dart';

typedef OnTapCallback = void Function();

class AddYouIconButton extends StatelessWidget {
  final OnTapCallback onTap;
  final Widget icon;
  final Widget label;
  final Color? backgroundColor;

  const AddYouIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.label,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  Widget _buildIcon() {
    return Container(
      width: kToolbarHeight * 0.80,
      height: kToolbarHeight * 0.80,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(5),
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildIcon(),
          const SizedBox(height: 10),
          label,
        ],
      ),
    );
  }
}
