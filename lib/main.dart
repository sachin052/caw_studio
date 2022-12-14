import 'package:caw_studio/core/theme/color.dart';
import 'package:caw_studio/features/authentication/presentation/sign_up_screen.dart';
import 'package:caw_studio/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'injector.dart';

void main() {
  configureDependencies();
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
        primaryColor:colorPrimary,scaffoldBackgroundColor: scaffoldBackgroundColor
      ),
      home:  const HomePage(),
    );
  }
}
