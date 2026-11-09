import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod_template/portfolio/constants/portfolio_colors.dart';
import 'package:flutter_riverpod_template/portfolio/portfolio_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  runApp(const RemonPortfolioApp());
}

class RemonPortfolioApp extends StatelessWidget {
  const RemonPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Remon Chandra Howlader | Senior Flutter & Mobile Architect",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: PortfolioColors.background,
        primaryColor: PortfolioColors.primary,
        colorScheme: const ColorScheme.dark(
          primary: PortfolioColors.primary,
          secondary: PortfolioColors.secondary,
          surface: PortfolioColors.surface,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
      ),
      home: const PortfolioScreen(),
    );
  }
}
