import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_verification/controllers/phone_authentication.dart';
import 'package:otp_verification/widgets/colors.dart';
import 'package:otp_verification/widgets/common_Button.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  final PhoneAuthentication _phoneAuthentication = PhoneAuthentication();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //signout user
  signOut() async {
    await _phoneAuthentication.logOutUser();
    Navigator.of(context).pushReplacementNamed('/homeScreen');
  }

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dash Screen'),
      ),
      drawer: Drawer(
        width: 300,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 50, 8, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListTile(
                  leading: user?.photoURL != null
                      ? CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(user!.photoURL!),
                  )
                      : null,
                  title: Text(user?.displayName ?? ''),
                  subtitle: Text(user?.email ?? ''),
                ),
                CommonButton(
                  title: 'Logout',
                  onPressed: signOut,
                  color: ColorTheme.commonColor,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Gambar Background
          SizedBox.expand(
            child: Image.asset(
              'assets/images/mountain.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Konten di atas background
          Center(
            child: Text(
              'Selamat Datang di Dash Screen',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
