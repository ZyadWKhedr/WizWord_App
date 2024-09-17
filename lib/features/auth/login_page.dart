import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/utils/assets.dart';
import 'package:wizwords/core/widgets/custom_button.dart';
import 'package:wizwords/core/widgets/custom_text_field.dart';
import 'package:wizwords/features/auth/auth_controller.dart';
import 'package:wizwords/features/widgets/facebook_google.dart';
import 'package:wizwords/features/widgets/or_row.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Wizwords title
              const Center(
                child: Text(
                  'Wizwords',
                  style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(height: 120),

              // Email field
              _buildLabel('Email:'),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _emailController,
                validator: _emailValidator,
              ),
              const SizedBox(height: 20),

              // Password field
              _buildLabel('Password:'),
              const SizedBox(height: 10),
              CustomTextField(
                controller: _passwordController,
                isPassword: true,
                validator: _passwordValidator,
              ),
              const SizedBox(height: 60),

              // Login button
              Center(
                child: CustomButton(
                  width: 500,
                  text: 'Login',
                  onPressed: () {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();
                    final authController = Get.find<AuthController>();

                    if (_emailValidator(email) == null &&
                        _passwordValidator(password) == null) {
                      authController.login(email, password);
                    } else {
                      Get.snackbar(
                          'Error', 'Please correct the errors in the form');
                    }
                  },
                ),
              ),
              const SizedBox(height: 45),

              // OR separator row
              const OrRow(),

              // Facebook/Google login options and image
              Stack(
                children: [
                  Image.asset(
                    AssetsData.girlStack,
                    height: 200,
                    width: 200,
                  ),
                  const FacebookGoogle(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build label for email and password fields
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: mainColor,
          fontSize: 20,
        ),
      ),
    );
  }

  // Email validator
  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password validator
  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }
}
