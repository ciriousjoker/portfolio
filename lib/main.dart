import "package:flutter/material.dart";
import "package:portfolio/config/colors.config.dart";
import "package:portfolio/ui/loading/loading.dart";
import "package:portfolio/ui/screen/home.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    stopLoading();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Philipp Bauer",
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.copyWith(
              headlineSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontFamily: "Catamaran",
                    color: Colors.black87,
                    fontWeight: FontWeight.w200,
                    fontSize: 24,
                  ),
              bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontFamily: "Catamaran",
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 16,
                  ),
              bodySmall: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontFamily: "Catamaran",
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    fontSize: 12,
                  ),
            ),
        primaryColor: ColorsConfig.primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorsConfig.accent),
      ),
      // home: HomeScreen(),
      home: const HomeScreen(),
    );
  }
}
