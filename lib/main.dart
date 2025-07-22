import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_easy/screens/home_screen.dart';
import 'package:move_easy/screens/language_selection.dart';
import 'package:move_easy/screens/otp_screen.dart';
import 'package:move_easy/screens/phone_number.dart';
import 'package:move_easy/screens/policy_screen.dart';
import 'package:move_easy/screens/splash_screen.dart';

void main() {
  runApp(const MoveEasyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class MoveEasyApp extends StatelessWidget {
  const MoveEasyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Move Easy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/language': (context) => const LanguageSelectionScreen(),
        '/phone': (context) => const PhoneNumberScreen(),
        '/otp': (context) => const OTPScreen(),
        '/policy': (context) => const PolicyScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
