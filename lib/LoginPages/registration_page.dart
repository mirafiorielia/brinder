import 'package:brinder/CustomWidgets/custom_background.dart';
import 'package:brinder/CustomWidgets/custom_textfield.dart';
import 'package:brinder/Utils/colors.dart';
import 'package:brinder/Utils/firebase_api.dart';
import 'package:brinder/Utils/functions.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late TextEditingController usernameController,
      emailController,
      passwordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    usernameController = TextEditingController(text: '');
    emailController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
            onPressed: () async {
              String username = usernameController.text.toLowerCase();
              String email = emailController.text.toLowerCase();
              String password = passwordController.text.toString();

              if (!_formKey.currentState!.validate()) {
                print('MANCANO I CAMPI');
                return;
              }

              await FirebaseApi.createUser(email, password);

              if (mounted) return;
              Navigator.of(context).pop();
            },
            child: Text(
              'Registrati',
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

  Widget _buildUsernameField() {
    return CustomTextField(
      controller: usernameController,
      hint: 'Username',
      prefixIcon: Icons.person_rounded,
      suffixIcon: Icons.cancel_rounded,
      textColor: onPrimary,
      iconColor: onPrimary,
      inputType: TextInputType.emailAddress,
      onSuffixIconPressed: () {
        usernameController.clear();
      },
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: const EdgeInsets.only(top: 21, bottom: 13),
      child: Text(
        'Registrati',
        style: Theme.of(context).textTheme.headline1?.merge(
              const TextStyle(
                fontSize: 50,
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
          mainAxisAlignment: MainAxisAlignment.center,
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 21),
                            _buildUsernameField(),
                            const SizedBox(height: 34),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
