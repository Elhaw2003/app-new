import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/utilies/app_fonts.dart';
import 'featuers/splash/presentation/view/splash_screen.dart';
import 'firebase_options.dart';

main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppNew());
}

class AppNew extends StatelessWidget {
  const AppNew({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: AppFonts.poppins,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
