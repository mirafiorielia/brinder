import 'package:brinder/Utils/functions.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({
    Key? key,
     this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      shadowColor: Colors.transparent,
      title: Image.asset(
        '${getImagesUrl()}logo.png',
        width: MediaQuery.of(context).size.width * 0.50,
      ),
      leading: IconButton(
        onPressed: () {
          print('MENU - SETTINGS');
        },
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            print('CART');
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
