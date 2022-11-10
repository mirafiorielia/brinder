import 'package:brinder/CustomWidgets/custom_textfield.dart';
import 'package:brinder/Utils/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController, passwordController;

  @override
  void initState() {
    emailController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
    super.initState();
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      controller: passwordController,
      hint: 'Password',
      prefixIcon: Icons.lock_rounded,
      suffixIcon: Icons.cancel_rounded,
      inputType: TextInputType.visiblePassword,
      onSuffixIconPressed: () {
        passwordController.clear();
      },
      margin: const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      controller: emailController,
      hint: 'Email',
      prefixIcon: Icons.email_rounded,
      suffixIcon: Icons.cancel_rounded,
      inputType: TextInputType.emailAddress,
      onSuffixIconPressed: () {
        emailController.clear();
      },
      margin: const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Brinder',
      style: Theme.of(context).textTheme.headline1?.merge(
            const TextStyle(
              color: primary,
              fontSize: 100,
              fontWeight: FontWeight.normal
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildTitle(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.13),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildEmailField(),
                  const SizedBox(height: 21),
                  _buildPasswordField(),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
