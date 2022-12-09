import 'package:brinder/CustomWidgets/custom_background.dart';
import 'package:brinder/CustomWidgets/custom_textfield.dart';
import 'package:brinder/LoginPages/registration_page.dart';
import 'package:brinder/Utils/colors.dart';
import 'package:brinder/Utils/firebase_api.dart';
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
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegistrationPage(),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 21),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: _pushToRegistration,
            child: Text(
              'Non hai un account? Registrati',
              style: Theme.of(context).textTheme.bodyText1?.merge(
                    const TextStyle(
                      letterSpacing: 2,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 21),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              String email = emailController.text.toLowerCase();
              String password = passwordController.text.toString();

              if (email.isEmpty || password.isEmpty) return;

              await FirebaseApi.createUser(email, password);

              if (mounted) return;
              Navigator.of(context).pop();
            },
            child: Text(
              'Accedi',
              style: Theme.of(context).textTheme.headline1?.merge(
                    const TextStyle(
                      letterSpacing: 2,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      controller: passwordController,
      hint: 'Password',
      prefixIcon: Icons.lock_rounded,
      suffixIcon: Icons.cancel_rounded,
      textColor: onPrimary,
      iconColor: onPrimary,
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
      textColor: onPrimary,
      iconColor: onPrimary,
      inputType: TextInputType.emailAddress,
      onSuffixIconPressed: () {
        emailController.clear();
      },
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 21, bottom: 13),
      child: Text(
        'Brinder',
        style: Theme.of(context).textTheme.headline1?.merge(
              const TextStyle(
                fontSize: 100,
              ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTitle(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 89),
                    CustomBackground(
                      backgroundColor: primary,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                    const SizedBox(height: 34),
                    _buildLoginButton(),
                    const SizedBox(height: 13),
                    _buildRegisterButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
