import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp_verification/app_Theme.dart';
import 'package:otp_verification/screens/dash_Screen.dart';
import 'package:otp_verification/screens/home_Screen.dart';
import 'package:otp_verification/screens/phone_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAW4h5i8aLcPwBWtnxA5fB3eUr7osYZMA4",
        appId: "1:70658445415:android:433cbd8fcc84b89d0904c2",
        messagingSenderId: "70658445415",
        projectId: "otp2-35906",
        storageBucket: "otp2-35906.appspot.com",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme().lightTheme,
      home: const HomeScreen(),
      routes: {
        '/homeScreen': (_) => const HomeScreen(),
        // '/otpScreen': (_) => const OTPScreen(
        //       verification: '',
        //     ),
        '/phoneScreen': (_) => const PhoneScreen(),
        '/dashScreen': (_) => DashScreen(),
      },
    );
  }
}