import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_challenge/screens/home/home_screen.dart';
import 'package:youtube_challenge/screens/splash/splash_screen.dart';
import 'package:youtube_challenge/screens/video/video_screen.dart';
import 'package:youtube_challenge/widgets/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: YColors.textColor,
        accentColor: YColors.textColor,
        canvasColor: YColors.canvas
      ),
      initialRoute: "/splash",
      routes: {
        "/":            (_) => HomeScreen(),
        "/splash":      (_) => SplashScreen(),
        "/video":       (_) => VideoScreen(),
      },
    );
  }
}
