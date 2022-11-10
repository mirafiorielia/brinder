import 'package:brinder/Utils/colors.dart';
import 'package:flutter/material.dart';

typedef OnTapCallback = void Function();

class CustomTextFieldButton extends StatelessWidget {
  final String? hint;
  final IconData? prefixIcon, suffixIcon;
  final Color textColor, iconColor, dividerColor;
  final OnTapCallback? onTap;
  final EdgeInsets? margin;

  const CustomTextFieldButton({
    Key? key,
    required this.hint,
    required this.prefixIcon,
    required this.suffixIcon,
    this.textColor = onSecondary,
    this.iconColor = onSecondary,
    this.dividerColor = onSecondary,
    required this.onTap,
    required this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  prefixIcon,
                  color: iconColor,
                ),
                Text(
                  hint ?? '',
                  style: Theme.of(context).textTheme.bodyText1?.merge(
                        TextStyle(
                          color: textColor,
                        ),
                      ),
                ),
                Icon(
                  suffixIcon,
                  color: iconColor,
                ),
              ],
            ),
            Divider(
              color: dividerColor,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
