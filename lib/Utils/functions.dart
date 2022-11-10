import 'package:flutter/material.dart';

import 'colors.dart';

String getIconsUrl() {
  return 'assets/icons/';
}

String getImagesUrl() {
  return 'assets/images/';
}

String getMapStylesUrl() {
  return 'assets/map_styles/';
}

String getPdfUrl() {
  return 'assets/pdf/';
}

void showSnackBar(BuildContext context, String message, bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: Theme.of(context).textTheme.bodyText1!.merge(
            const TextStyle(
              color: Colors.white,
            ),
          ),
    ),
    backgroundColor: isError ? Colors.red : onPrimary,
  ));
}
