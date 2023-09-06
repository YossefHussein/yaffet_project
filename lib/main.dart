import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yaffet/controllers/cubit.dart';
import 'package:yaffet/controllers/observer.dart';
import 'package:yaffet/controllers/states.dart';
import 'package:yaffet/models/local_database/alert_database/alert_database_cubit.dart';
import 'package:yaffet/models/local_database/depot_database/depot_database_cubit.dart';

import 'models/dio/dio_cubit/dio_cubit.dart';
import 'models/my_http_overrides.dart';
import 'views/modules/welcome_screen.dart';
import 'views/ui/styles/colors.dart';
import 'views/ui/styles/sizes.dart';
import 'models/dio/dioHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  HttpOverrides.global = MyHttpOverrides();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 690),
      builder: (BuildContext context, Widget? child) => MultiBlocProvider(
        providers: [
          // to create data for alert
          BlocProvider<AlertDatabaseCubit>(
            create: (context) => AlertDatabaseCubit()..createAlertDatabase(),
          ),
          // for create data for depot
          BlocProvider<DepotDatabaseCubit>(
            create: (context) => DepotDatabaseCubit()..createDepotDatabase(),
          ),
          // for get general functions or variables of application
          BlocProvider<AppCubit>(
            create: (context) => AppCubit(),
          ),
          BlocProvider<DioCubit>(
            create: (context) => DioCubit()..getSilverPriceHistory(),
          ),
        ],
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'yaffet',
              theme: ThemeData(
                textTheme: GoogleFonts.interTextTheme().apply(
                  bodyColor: pTextColor,
                  displayColor: pTextColor,
                ),
                appBarTheme: const AppBarTheme(
                  color: pAppBarColor,
                ),
                scaffoldBackgroundColor: pScaffoldColor,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: pButtonColor,
                ),
                iconButtonTheme: IconButtonThemeData(
                  style: ButtonStyle(
                    iconColor: MaterialStateProperty.all(
                      pColorIconBottomNav,
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      pColorIconBottomNav,
                    ),
                  ),
                ),
                bottomAppBarTheme: BottomAppBarTheme(
                  // this is color of bottomAppBar
                  color: pColorBottomNav,
                  // this is height of BottomAppBar
                  height: pHeightNavBar,
                ),
              ),
              home: const WelcomeScreen(),
            );
          },
        ),
      ),
    );
  }
}
