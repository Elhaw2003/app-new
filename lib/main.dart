import 'package:app_new/featuers/bookmark/presentation/controller/book_mark/book_mark_cubit.dart';
import 'package:app_new/featuers/home_page/data/models/new_model.dart';
import 'package:app_new/featuers/home_page/data/repos/home_page_implementation_repo.dart';
import 'package:app_new/featuers/home_page/presentation/controller/get_top_headline/get_top_headline_cubit.dart';
import 'package:app_new/featuers/splash/presentation/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/utilies/app_fonts.dart';
import 'core/utilies/hive.dart';
import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NewModelAdapter());
  Hive.registerAdapter(SourceModelAdapter());
  await Hive.openBox<NewModel>(MyHive.newsBox);
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
      create: (context) => TopHeadLineCubit(homePageRepo: HomePageImplementationRepo()),
      ),
      BlocProvider(
          create: (context) => BookMarkCubit(),
      ),
    ],

      child: const AppNew()));
}

class AppNew extends StatefulWidget {
  const AppNew({super.key});

  @override
  State<AppNew> createState() => _AppNewState();
}

class _AppNewState extends State<AppNew> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BookMarkCubit>(context).addBookMarksToBox();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: AppFonts.poppins,
      ),
      debugShowCheckedModeBanner: false,
      home:  const SplashScreen(),
    );
  }
}