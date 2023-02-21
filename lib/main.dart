import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_land/features/auth/presentation/views/login_view.dart';
import 'package:movies_land/features/auth/presentation/views/signup_view.dart';
import 'package:movies_land/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MoviesLand());
}

class MoviesLand extends StatelessWidget {
  const MoviesLand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        backgroundColor: Colors.black,
        //primaryColor: Colors.white,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      home: const LoginView(),
    );
  }
}
