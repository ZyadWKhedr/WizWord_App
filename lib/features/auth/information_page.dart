import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wizwords/const.dart';
import 'package:wizwords/core/utils/assets.dart';
import 'package:wizwords/core/widgets/custom_button.dart';
import 'package:wizwords/core/widgets/custom_text_field.dart';
import 'package:wizwords/features/auth/auth_controller.dart';
import 'package:wizwords/features/widgets/facebook_google.dart';
import 'package:wizwords/features/widgets/or_row.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final AuthController _authController =
      Get.find(); // Initialize AuthController

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Password strength validation logic
  bool isPasswordStrong(String password) {
    return password.length >= 8 && // Password length
        RegExp(r'[A-Z]').hasMatch(password) && // At least one uppercase letter
        RegExp(r'[a-z]').hasMatch(password) && // At least one lowercase letter
        RegExp(r'[0-9]').hasMatch(password); // At least one digit
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SizedBox(height: 40),

                // Name
                const Text(
                  'Name',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 20,
                  ),
                ),
                CustomTextField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Email
                const Text(
                  'Email',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 20,
                  ),
                ),
                CustomTextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Password
                const Text(
                  'Password',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 20,
                  ),
                ),
                CustomTextField(
                  controller: _passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (!isPasswordStrong(value)) {
                      return 'Password is too weak. Use at least 8 characters, including upper/lowercase and digits.';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Confirm Password
                const Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 20,
                  ),
                ),
                CustomTextField(
                  controller: _confirmPasswordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                Center(
                  child: CustomButton(
                    width: 500,
                    text: 'Next',
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        try {
                          // Register user
                          _authController.register(
                            _emailController.text,
                            _passwordController.text,
                            _nameController.text,
                          );

                          // Navigate to Verification Page
                          Get.toNamed('/verification', parameters: {
                            'userName': _nameController.text,
                          });
                        } catch (e) {
                          Get.snackbar('Error', e.toString());
                        }
                      }
                    },
                  ),
                ),

                const SizedBox(height: 20),
                const OrRow(),

                Stack(
                  children: [
                    Image.asset(
                      AssetsData.girlStack,
                      width: 150,
                      height: 150,
                    ),
                    const FacebookGoogle(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
