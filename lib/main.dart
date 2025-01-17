import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realeastapp/pages/home.dart';
import 'package:realeastapp/pages/login.dart';
import 'package:realeastapp/pages/regsiter.dart';
import 'package:realeastapp/pages/search.dart';
import 'package:realeastapp/pages_2/payment_home.dart';
import 'package:realeastapp/pages_2/transaction_settings.dart';
import 'package:realeastapp/pages_2/web_pos.dart';

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
        '/userHome': (context) => const UserHome(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/search': (context) => const Search(),
        '/paymentHome' :  (context) => const PaymentHome(),
        '/transaction' :  (context) => const PaymentHome(),
        '/transactionSettings' :  (context) => const TransactionSettings(),
        '/transactionDetails' :  (context) => const PaymentHome(),
        '/webPos' :  (context) => const WebPosView(),
      },
      home: const UserHome(),
    );
  }
}
