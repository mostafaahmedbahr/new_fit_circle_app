import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_fit_circle_last_ui/dio/sh/sh.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/auth/login/login_screen.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/on_boarding/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/on_boarding/on_boarding_screen.dart';
import 'package:new_fit_circle_last_ui/shared/bloc_observer.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'dio/dio.dart';
import 'lang/codegen_loader.g.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  await EasyLocalization.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(
      EasyLocalization(
          supportedLocales: const [
            Locale('en',""),
            Locale('ar',""),
          ],
          path: 'assets/lang',
          saveLocale: true,// <-- change the path of the translation files
          fallbackLocale: const Locale('en',""),
          useOnlyLangCode: true,
          assetLoader: const CodegenLoader(),
          child:  const MyApp()
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardingCubit()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Fit Circle',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
        ),
        debugShowCheckedModeBanner: false,
        home: const PlayerLoginScreen(),
        builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        ),
      ),
    );
  }
}