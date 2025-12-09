import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tareeqna/Features/onBoarding/Presentation/views/on_boarding_screen.dart';
import 'package:tareeqna/Features/main_layout/Presentation/views/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.white,
          ),
  );
  runApp(const TAREEQNA());
}

// theme
class TAREEQNA extends StatelessWidget {
  const TAREEQNA({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAREEQNA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1ABC9C),
       // textTheme: GoogleFonts.poppinsTextTheme(),

        scaffoldBackgroundColor: Colors.white,
        appBarTheme:const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(
            fontSizeFactor: 0.6,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1ABC9C),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
        ),
      ),
      home: const MainScreen(),
    //  home: const OnboardingScreen(),
      // OnboardingScreen(),
    );
  }
}
