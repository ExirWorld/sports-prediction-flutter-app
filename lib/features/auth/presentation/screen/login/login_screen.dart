import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/customui/more/margin_container.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/features/auth/presentation/screen/login/widget/button_login.dart';
import 'package:oxir_game/features/auth/presentation/screen/login/widget/sms_login_link.dart';
import 'package:oxir_game/features/auth/presentation/screen/login/widget/title_login.dart';
import 'package:oxir_game/features/auth/presentation/widget/appbar_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/footer_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/pass_textfild_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/phone_textfild_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/remember_me_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      appBar: appBarAuth(context, false),
      body: SingleChildScrollView(
        child: HorizontalMarginContainer(
          margin: padding_Horizantalx,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const TitleLogin(),
                const VerticalSpace(vertical_spacing_5x),

                // تکست فیلد نام کاربری
                const PhoneTextFildAuth(),
                const VerticalSpace(vertical_spacing_4x),

                // تکست فیلد رمز عبور
                const PassTextFildAuth(),
                const VerticalSpace(vertical_spacing_5x),

                // مرا به خاطر بسپار و فراموشی رمز عبور
                const RememberMeAuth(),
                const VerticalSpace(vertical_spacing_8x),

                // دکمه ورود
                ButtonLogin(formKey: formKey),
                const VerticalSpace(vertical_spacing_6x),

                // ورود با کد یکبار مصرف
                const SmsLoginLink(),

                // فوتر
                const FooterAuth(
                  title: 'Don`t have an account?',
                  titleLink: 'Register',
                  isToRegister: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
