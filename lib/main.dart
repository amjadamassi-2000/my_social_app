import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/shared/BlocObserver.dart';
import 'package:my_social_app/shared/Network/local/sharedPreferences.dart';
import 'package:my_social_app/shared/cubit/cubit.dart';
import 'package:my_social_app/shared/cubit/states.dart';
import 'package:my_social_app/shared/styles/Themes.dart';
import 'layouts/cubit/cubit.dart';
import 'layouts/home_layout.dart';
import 'modules/LoginScreen/login_screen.dart';
import 'modules/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Widget widget;

  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp();

  await CacheHelper.init();



  if (CacheHelper.getData(key: 'uId') != null) {
    widget = HomeScreen();
  } else
    widget = SplashScreen();

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

   final Widget startWidget;

  MyApp({required this.startWidget});



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppCubit(),
          ),
          BlocProvider(
              create: (context) => HomeCubit()
                ..getUserData()
                ..getAllPostsData()),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode:HomeCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: startWidget);
          },
        ));
  }
}
