import 'package:flutter/material.dart';
import 'package:otp_verification/controllers/phone_authentication.dart';
import 'package:otp_verification/widgets/colors.dart';
import 'package:otp_verification/widgets/common_Button.dart';
import 'package:otp_verification/widgets/text_FormField.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // loginUser
  signGoogle() async {
    await PhoneAuthentication().signWithGoogle();
    Navigator.of(context).pushNamed('/dashScreen');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Gambar Background
          SizedBox.expand(
            child: Image.asset(
              'assets/images/img_4.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Konten di atas background
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _textFormField(),
                        const SizedBox(height: 20),
                        CommonButton(
                          onPressed: () {},
                          title: 'Continue',
                          color: Colors.white, // Warna tombol putih solid
                        ),
                        const SizedBox(height: 20),
                        _socialButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFormField() => Column(
    children: [
      TextFieldForm(
        controller: emailController,
        labelText: 'Email',
        labelStyle: const TextStyle(color: Colors.white),
      ),
      const SizedBox(height: 10),
      TextFieldForm(
        controller: passwordController,
        labelText: 'Password',
        isObscure: true,
        labelStyle: const TextStyle(color: Colors.white),
      ),
    ],
  );

  Widget _socialButton() => Column(
    children: [
      CommonButton(
        onPressed: signGoogle,
        color: Colors.white, // Warna tombol putih solid
        title: 'Continue with Google',
        imgPath: 'assets/images/google.jpg',
      ),
      const SizedBox(height: 10),
      CommonButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/phoneScreen');
        },
        color: Colors.white, // Warna tombol putih solid
        title: 'Continue with Phone',
        imgPath: 'assets/images/phone.jpg',
      ),
    ],
  );
}
