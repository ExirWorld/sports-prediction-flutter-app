import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/locator/di/di.dart';
import 'package:oxir_game/features/Timer/bloc/timer_bloc.dart';
import 'package:oxir_game/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:oxir_game/features/splash/bloc/splash_bloc.dart';
import 'package:oxir_game/features/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(environment: Env.prod);
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('fa'),
        Locale('en'),
      ],
      startLocale: const Locale('en'),
      saveLocale: true,
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<SplashBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<TimerBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Oxir Game',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
