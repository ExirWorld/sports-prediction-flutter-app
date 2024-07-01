import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/margin_container.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/core/customui/notifications/snackbar_error.dart';
import 'package:oxir_game/core/shared_preferences/shared_preferences_key.dart';
import 'package:oxir_game/core/shared_preferences/shared_preferences_service.dart';
import 'package:oxir_game/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:oxir_game/features/auth/presentation/screen/forgot_password/confirm_code_screen.dart';
import 'package:oxir_game/features/auth/presentation/widget/appbar_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/phone_textfild_auth.dart';
import 'package:oxir_game/gen/assets.gen.dart';

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: appBarAuth(context, false),
      body: HorizontalMarginContainer(
        margin: padding_Horizantalx,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.forgetfulness.svg(),
              const VerticalSpace(vertical_spacing_10x),
              const VeryHugeBoldText(
                'Forget Password',
                textColorInLight: Color(0xff02629F),
              ),
              const VerticalSpace(vertical_spacing_3x),
              const SmallBoldText(
                'شماره تماس خود را وراد کنید',
                textColorInLight: Color(0xff302E43),
              ),
              const VerticalSpace(vertical_spacing_4x),
              const PhoneTextFildAuth(),
              const VerticalSpace(vertical_spacing_10x),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is RequestSmsCompletedState) {
                    PrefService prefService = PrefService();
                    prefService
                        .createCacheString(
                      SharedKey.pairRequestSms,
                      state.successEntity.code!,
                    )
                        .then(
                      (value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ConfirmCodeScreen(),
                            ));
                      },
                    );
                  } else if (state is RequestSmsErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      snackBarError(
                        context: context,
                        title: 'متاسفیم!',
                        desc: state.errorText,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(RequestSmsEvent(
                            PhoneTextFildAuth.phoneController.text));
                      }
                    },
                    child: Container(
                      height: BUTTON_HEIGHTx2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xff0867A3),
                          borderRadius: BorderRadius.circular(RADIUS_BUTTON3x)),
                      child: state is RequestSmsLoadingState
                          ? const CupertinoActivityIndicator(color: WHITE_COLOR)
                          : const LargeBoldText(
                              'ادامه',
                              textColorInLight: TEXT_LIGHT_COLOR,
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
