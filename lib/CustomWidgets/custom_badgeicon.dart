import 'package:brinder/Utils/colors.dart';
import 'package:flutter/material.dart';

class CustomBadgeIcon extends StatelessWidget {
  final int count;
  final EdgeInsets margin;
  final IconData icon;
  final Color iconColor, badgeColor, countColor;

  const CustomBadgeIcon({
    Key? key,
    this.count = 0,
    this.margin = EdgeInsets.zero,
    required this.icon,
    this.iconColor = onSecondary,
    this.badgeColor = Colors.red,
    this.countColor = onSecondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          Positioned(
            right: 0,
            top: 10,
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: ShapeDecoration(
                color: badgeColor,
                shape: const StadiumBorder(),
              ),
              child: Text(
                '$count',
                style: Theme.of(context).textTheme.bodyText1?.merge(
                      TextStyle(
                        color: countColor,
                        fontSize: 13,
                      ),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
