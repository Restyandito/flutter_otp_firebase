import 'package:flutter/material.dart';
import 'package:otp_verification/widgets/app_TextStyle.dart';
import 'package:otp_verification/widgets/colors.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Color? color;
  final dynamic imgPath;
  final VoidCallback onPressed;
  const CommonButton({
    super.key,
    this.imgPath,
    required this.title,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Menggunakan ukuran minimum
            children: [
              if (imgPath != null)
                ClipOval(
                  child: Image.asset(
                    imgPath!,
                    fit: BoxFit.cover,
                    height: 20,
                    width: 20,
                  ),
                ),
              if (imgPath != null) const SizedBox(height: 4), // Jarak kecil jika ada gambar
              Text(
                title,
                textAlign: TextAlign.center,
                style: appTextStyle(
                  ColorTheme.blackColor,
                  FontWeight.bold,
                  16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
