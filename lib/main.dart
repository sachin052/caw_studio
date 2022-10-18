import 'package:caw_studio/features/authentication/presentation/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        primaryColor: const Color(0xff00A981),scaffoldBackgroundColor: Color(0xFFE5E5E5)
      ),
      home:  const SignUpScreen(),
    );
  }
}
