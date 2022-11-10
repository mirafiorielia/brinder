import 'package:brinder/CustomWidgets/custom_background.dart';
import 'package:brinder/CustomWidgets/custom_textfield.dart';
import 'package:brinder/LoginPages/registration_page.dart';
import 'package:brinder/Utils/colors.dart';
import 'package:brinder/Utils/functions.dart';
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _pushToRegistration() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const RegistrationPage(),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return TextButton(
      onPressed: _pushToRegistration,
      child: Text(
        'Registrati',
        style: Theme.of(context).textTheme.bodyText1?.merge(
              const TextStyle(
                color: primary,
                letterSpacing: 2,
              ),
            ),
      ),
    );
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
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
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
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Brinder',
      style: Theme.of(context).textTheme.headline1?.merge(
            const TextStyle(
              color: primary,
              fontSize: 100,
              fontWeight: FontWeight.normal,
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
            child: CustomBackground(
              backgroundColor: primaryLight,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 21),
                  _buildEmailField(),
                  const SizedBox(height: 34),
                  _buildPasswordField(),
                  const SizedBox(height: 21),
                ],
              ),
            ),
          ),
          const SizedBox(height: 34),
          _buildRegisterButton(),
        ],
      )),
    );
  }
}
