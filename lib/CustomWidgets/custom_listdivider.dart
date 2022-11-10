import 'package:brinder/Utils/colors.dart';
import 'package:flutter/material.dart';

typedef OnTapCallback = void Function();

class CustomListDivider extends StatelessWidget {
  final String dividerTitle, buttonTitle;
  final Color backgroundColor, elementColor;
  final OnTapCallback? onTap;
  final EdgeInsets? margin, padding;

  const CustomListDivider({
    Key? key,
    required this.dividerTitle,
    required this.buttonTitle,
    this.backgroundColor = secondary,
    this.elementColor = onSecondary,
    this.onTap,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      color: backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            dividerTitle,
            style: Theme.of(context).textTheme.headline1?.merge(
                  TextStyle(
                    color: elementColor,
                  ),
                ),
          ),
          InkWell(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  buttonTitle,
                  style: Theme.of(context).textTheme.bodyText1?.merge(
                        TextStyle(
                          color: elementColor,
                        ),
                      ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_right_alt,
                  color: elementColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
