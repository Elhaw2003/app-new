import 'package:app_new/featuers/home_page/data/repos/home_page_implementation_repo.dart';
import 'package:app_new/featuers/home_page/presentation/controller/get_top_headline/get_top_headline_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utilies/app_fonts.dart';
import 'featuers/splash/presentation/view/splash_screen.dart';
import 'firebase_options.dart';

main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BlocProvider(
    create: (context) => TopHeadLineCubit(homePageRepo: HomePageImplementationRepo()),
      child: const AppNew()));
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
