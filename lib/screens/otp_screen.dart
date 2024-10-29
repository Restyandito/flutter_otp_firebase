import 'package:flutter/material.dart';
import 'package:otp_verification/controllers/phone_Authentication.dart';
import 'package:otp_verification/widgets/app_TextStyle.dart';
import 'package:otp_verification/widgets/colors.dart';
import 'package:otp_verification/widgets/common_Button.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  final String verification;
  const OTPScreen({
    super.key,
    required this.verification,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpController = TextEditingController();
  _commonPinput([Color color = ColorTheme.blackColor]) => PinTheme(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(color: color),
    ),
  );

//verifyOTP

  verifyOTP() async {
    try {
      String result = await PhoneAuthentication().verifyOTPCode(
        verifyId: widget.verification,
        otp: otpController.text,
      );
      if (result == 'success') {
        Navigator.of(context).pushReplacementNamed('/dashScreen');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP Verification Failed'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    } catch (e) {
      e.toString();
    }
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/phoneScreen');
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/img_3.jpg',
                  height: 200,
                  width: 200,
                ),
              ),
              Text(
                'OTP Verification',
                style: appTextStyle(ColorTheme.blackColor, FontWeight.bold, 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Enter the OTP Code sent to your number',
                style: appTextStyle(ColorTheme.blackColor, FontWeight.w200, 12),
              ),
              const SizedBox(
                height: 20,
              ),
              Pinput(
                controller: otpController,
                length: 6,
                defaultPinTheme: _commonPinput(),
                focusedPinTheme: _commonPinput(ColorTheme.focusedColor),
                followingPinTheme: _commonPinput(ColorTheme.focusedColor),
                onChanged: (value) {
                  otpController.text = value;
                },
              ),
              const SizedBox(height: 100),
              CommonButton(
                title: 'Continue',
                onPressed: verifyOTP,
                color: ColorTheme.commonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}