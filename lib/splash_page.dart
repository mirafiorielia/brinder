import 'package:brinder/Utils/colors.dart';
import 'package:brinder/LoginPages/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.microtask(() => _pushToLogin());
    super.initState();
  }

  void _pushToLogin() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: Center(
        child: Placeholder(
          color: Colors.white,
          fallbackWidth: MediaQuery.of(context).size.width * 0.84,
          fallbackHeight: MediaQuery.of(context).size.width * 0.84,
        ),
      ),
    );
  }
}
