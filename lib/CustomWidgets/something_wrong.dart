import 'package:brinder/Utils/colors.dart';
import 'package:flutter/material.dart';

class SomethingWrong extends StatelessWidget {
  final String text;
  final IconData errorIcon;
  final Widget action;
  final FlutterErrorDetails details;

  const SomethingWrong({
    Key? key,
    required this.text,
    required this.errorIcon,
    required this.action,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(details.stack.toString());
    print(details.context?.value.toString());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 180,
            height: 120,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.red,
                      Colors.red.withOpacity(0.6),
                    ])),
            child: Icon(
              errorIcon,
              color: Colors.white,
              size: 70,
            ),
          ),
          const SizedBox(height: 20),
          Opacity(
            opacity: 0.7,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 20),
          action,
          Text(
            details.exception.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.merge(const TextStyle(color: Colors.grey)),
          ),
          Text(
            details.stack.toString().split("\n")[0],
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.merge(const TextStyle(color: Colors.grey)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
