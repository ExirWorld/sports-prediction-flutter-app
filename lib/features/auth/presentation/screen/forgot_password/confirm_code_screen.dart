import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/fonts.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/margin_container.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/core/customui/more/timer_widget.dart';
import 'package:oxir_game/core/customui/notifications/snackbar_error.dart';
import 'package:oxir_game/core/shared_preferences/shared_preferences_key.dart';
import 'package:oxir_game/core/shared_preferences/shared_preferences_service.dart';
import 'package:oxir_game/features/Timer/bloc/timer_bloc.dart';
import 'package:oxir_game/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:oxir_game/features/auth/presentation/screen/forgot_password/new_password_screen.dart';
import 'package:oxir_game/features/auth/presentation/widget/appbar_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/phone_textfild_auth.dart';
import 'package:oxir_game/gen/assets.gen.dart';
import 'package:pinput/pinput.dart';

class ConfirmCodeScreen extends StatefulWidget {
  const ConfirmCodeScreen({super.key});

  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  String? code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: appBarAuth(context, false),
      body: HorizontalMarginContainer(
        margin: padding_Horizantalx,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.verificationCode.svg(),
            const VerticalSpace(vertical_spacing_10x),
            const VeryHugeBoldText(
              'Send verification code',
              textColorInLight: Color(0xff02629F),
            ),
            const VerticalSpace(vertical_spacing_3x),
            SmallBoldText(
              'The confirmation code was sent to number  ${PhoneTextFildAuth.phoneController.text}',
              textColorInLight: const Color(0xff302E43),
            ),
            const VerticalSpace(vertical_spacing_4x),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                length: 5,
                keyboardType: TextInputType.number,
                submittedPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    color: Color.fromRGBO(30, 60, 87, 1),
                    fontFamily: defaultNumberFont,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffEAF7FF),
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: const Color(0xffEAF7FF)),
                  ),
                ),
                onChanged: (value) {
                  code = value;
                },
              ),
            ),
            const VerticalSpace(vertical_spacing_4x),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return TimerWidget(
                  onTap: () {
                    BlocProvider.of<AuthBloc>(context).add(
                        RequestSmsRepeatEvent(
                            PhoneTextFildAuth.phoneController.text));
                  },
                  isLoading:
                      state is RequestSmsRepeatLoadingState ? true : false,
                );
              },
            ),
            const VerticalSpace(vertical_spacing_10x),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is Login2FactorCompletedState) {
                  PrefService prefService = PrefService();
                  prefService.removeCache(SharedKey.jwtTokenTemp);
                  prefService
                      .createCacheString(
                          SharedKey.jwtTokenTemp, state.loginUserEntity.token!)
                      .then(
                    (value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewPasswordScreen(),
                          ));
                    },
                  );
                } else if (state is Login2FactorErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    snackBarError(
                      context: context,
                      title: 'we are sorry!',
                      desc: state.errorText,
                    ),
                  );
                } else if (state is RequestSmsRepeatErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    snackBarError(
                      context: context,
                      title: 'we are sorry!',
                      desc: state.errorText,
                    ),
                  );
                } else if (state is RequestSmsRepeatCompletedState) {
                  BlocProvider.of<TimerBloc>(context).add(Start());
                }
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    if (code != null && code!.length == 5) {
                      PrefService prefService = PrefService();
                      prefService
                          .readCacheString(SharedKey.pairRequestSms)
                          .then(
                        (value) {
                          BlocProvider.of<AuthBloc>(context)
                              .add(Login2FactorEvent(
                            key: code!,
                            pair: value,
                          ));
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        snackBarError(
                          context: context,
                          title: 'we are sorry!',
                          desc: 'The entered code is not correct!',
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: BUTTON_HEIGHTx2,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xff0867A3),
                        borderRadius: BorderRadius.circular(RADIUS_BUTTON3x)),
                    child: state is Login2FactorLoadingState
                        ? const CupertinoActivityIndicator(color: WHITE_COLOR)
                        : const LargeBoldText(
                            'Send code',
                            textColorInLight: TEXT_LIGHT_COLOR,
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
