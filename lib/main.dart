import 'package:flutter/material.dart';
import 'package:learn_language/screens/home_page.dart';
import 'package:learn_language/screens/lession_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme).copyWith(
          bodyMedium: GoogleFonts.raleway(textStyle: Theme.of(context).textTheme.bodyMedium),
          bodySmall: GoogleFonts.raleway(textStyle: Theme.of(context).textTheme.bodySmall),
          bodyLarge: GoogleFonts.raleway(textStyle: Theme.of(context).textTheme.bodyLarge),
          titleSmall: GoogleFonts.raleway(textStyle:Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Color(0xFF006A60),
          )),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.ralewayTextTheme(Theme.of(context).textTheme).copyWith(
          bodyMedium: GoogleFonts.raleway(textStyle: Theme.of(context).textTheme.bodyMedium),
          bodySmall: GoogleFonts.raleway(textStyle: Theme.of(context).textTheme.bodySmall),
          bodyLarge: GoogleFonts.raleway(textStyle: Theme.of(context).textTheme.bodyLarge),
          titleSmall: GoogleFonts.raleway(textStyle:Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.white
          )),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system, // ThemeMode.system uses device's theme mode
      home: const HomePage(),
    );
  }
}
