import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realeastapp/pages/home.dart';
import 'package:realeastapp/pages/login.dart';
import 'package:realeastapp/pages/regsiter.dart';
import 'package:realeastapp/pages/search.dart';

void main() {
  runApp(const RealEstateMyApp());
}

class RealEstateMyApp extends StatelessWidget {
  const RealEstateMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Estate',
      theme: ThemeData(
        useMaterial3: true,
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          // ···
          brightness: Brightness.dark,
        ),

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          // ···
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      routes: {
        '/userHome': (context) => UserHome(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/search': (context) => Search(),
      },
      home: const UserHome(),
    );
  }
}
