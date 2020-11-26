import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/colors.config.dart';
import 'package:portfolio/ui/screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Philipp Bauer",
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.copyWith(
              headline4: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.purple,
                      fontSize: 28,
                      fontWeight: FontWeight.w200,
                    ),
              ),
              headline5: Theme.of(context).textTheme.headline5.copyWith(
                    fontFamily: "Catamaran",
                    color: Colors.black87,
                    fontWeight: FontWeight.w200,
                    fontSize: 24,
                  ),
              bodyText2: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontFamily: "Catamaran",
                    color: Colors.black87,
                    height: 1.4,
                    fontSize: 16,
                  ),
              caption: Theme.of(context).textTheme.caption.copyWith(
                    fontFamily: "Catamaran",
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 12,
                  ),
            ),
        primarySwatch: ColorsConfig.primarySwatch,
        accentColor: ColorsConfig.accent,
      ),
      // home: HomeScreen(),
      home: HomeScreen(),
    );
  }
}
