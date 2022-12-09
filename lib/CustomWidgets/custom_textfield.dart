import 'package:brinder/Utils/colors.dart';
import 'package:flutter/material.dart';

typedef OnFieldSubmitted = void Function(String);
typedef OnSuffixIconPressed = void Function();

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final IconData? prefixIcon, suffixIcon;
  final Color textColor, iconColor;
  final TextInputType inputType;
  final OnFieldSubmitted? onFieldSubmitted;
  final OnSuffixIconPressed? onSuffixIconPressed;
  final EdgeInsets? margin;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.prefixIcon,
    required this.suffixIcon,
    this.textColor = primary,
    this.iconColor = primary,
    required this.inputType,
    this.onFieldSubmitted,
    this.onSuffixIconPressed,
    required this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        style: TextStyle(color: textColor),
        cursorColor: textColor,
        minLines: 1,
        maxLines: 20,
        onChanged: (value) {},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return hint;
          }
          return null;
        },
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: iconColor,
          ),
          prefixIconColor: iconColor,
          suffixIcon: IconButton(
            icon: Icon(
              suffixIcon,
              color: iconColor,
            ),
            onPressed: onSuffixIconPressed,
          ),
          suffixIconColor: iconColor,
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyText1?.merge(
                TextStyle(
                  color: textColor,
                ),
              ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: textColor),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textColor),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: textColor),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
