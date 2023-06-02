import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:async';
import 'screens/home_screen.dart';
//import 'screens/room_details.dart';
// import '/screens/account_screen.dart';
// import '/screens/login_screen.dart';
// import '/screens/reset_password_screen.dart';
// import '/screens/signup_screen.dart';
// import '/screens/verify_email_screen.dart';
// import '/services/firebase_streem.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartHouse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      home: const HomeScreen(),
      // routes: {
      //   '/': (context) => const FirebaseStream(),
      //   '/home': (context) => const HomeScreen(),
      //   //'/details': (context) => const RoomDetails(),
      //   '/account': (context) => const AccountScreen(),
      //   '/login': (context) => const LoginScreen(),
      //   '/signup': (context) => const SignUpScreen(),
      //   '/reset_password': (context) => const ResetPasswordScreen(),
      //   '/verify_email': (context) => const VerifyEmailScreen(),
      // },
      // initialRoute: '/',
    );
  }
}
