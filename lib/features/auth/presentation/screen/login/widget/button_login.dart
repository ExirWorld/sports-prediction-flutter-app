import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/notifications/snackbar_error.dart';
import 'package:oxir_game/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:oxir_game/features/auth/presentation/widget/pass_textfild_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/phone_textfild_auth.dart';
import 'package:oxir_game/features/root/presentation/root_screen.dart';

class ButtonLogin extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const ButtonLogin({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginUserErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            snackBarError(
              context: context,
              title: 'متاسفیم!',
              desc: state.errorText,
            ),
          );
        } else if (state is LoginUserCompletedState) {
          PhoneTextFildAuth.phoneController.clear();
          PassTextFildAuth.passController.clear();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const RootScreen(),
              ));
        }
      },
      builder: (context, state) {
        return BouncingWidget(
          duration: const Duration(milliseconds: 100),
          scaleFactor: 1.5,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<AuthBloc>(context).add(LoginUserEvent(
                userName: PhoneTextFildAuth.phoneController.text,
                password: PassTextFildAuth.passController.text,
              ));
            }
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xff0867A3),
              borderRadius: BorderRadius.circular(RADIUS_BUTTON3x),
            ),
            alignment: Alignment.center,
            child: state is LoginUserLoadingState
                ? const CupertinoActivityIndicator(color: WHITE_COLOR)
                : const LargeBoldText(
                    'LogIn',
                    textColorInLight: TEXT_LIGHT_COLOR,
                  ),
          ),
        );
      },
    );
  }
}
