import 'package:brinder/Utils/colors.dart';
import 'package:brinder/home_page.dart';
import 'package:brinder/login_page.dart';
import 'package:brinder/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Utils/themes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Brinder());
}

class Brinder extends StatelessWidget {
  const Brinder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brinder',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      home: const SplashPage(),
    );
  }
}
