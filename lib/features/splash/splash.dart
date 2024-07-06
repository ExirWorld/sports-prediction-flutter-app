import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/shared_preferences/shared_preferences_key.dart';
import 'package:oxir_game/core/shared_preferences/shared_preferences_service.dart';
import 'package:oxir_game/features/auth/presentation/screen/login/login_screen.dart';
import 'package:oxir_game/features/nav_bar/main_screen.dart';
import 'package:oxir_game/features/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;
  @override
  void initState() {
    PrefService prefService = PrefService();
    prefService.readCacheString(SharedKey.jwtToken).then(
      (value) {
        if (value != null) {
          BlocProvider.of<SplashBloc>(context).add(UserInfoEvent());
        } else {
          BlocProvider.of<SplashBloc>(context).add(TokenEmptyEvent());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is UserInfoErrorState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        } else if (state is UserInfoCompletedState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
        }
      },
      builder: (context, state) {
        return const Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: CupertinoActivityIndicator(
              color: WHITE_COLOR,
            ),
          ),
        );
      },
    );
  }
}
