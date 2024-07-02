import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/fonts.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/margin_container.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/core/customui/notifications/snackbar_error.dart';
import 'package:oxir_game/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:oxir_game/features/auth/presentation/screen/login/login_screen.dart';
import 'package:oxir_game/features/auth/presentation/widget/appbar_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/pass_textfild_auth.dart';
import 'package:oxir_game/gen/assets.gen.dart';
import 'package:password_strength_indicator/password_strength_indicator.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});
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
              Assets.images.changePassword.svg(),
              const VerticalSpace(vertical_spacing_10x),
              const VeryHugeBoldText(
                'Change Password',
                textColorInLight: Color(0xff02629F),
              ),
              const VerticalSpace(vertical_spacing_3x),
              const SmallBoldText(
                'Enter the new password',
                textColorInLight: Color(0xff302E43),
              ),
              const VerticalSpace(vertical_spacing_4x),
              const PassTextFildAuth(),
              const VerticalSpace(vertical_spacing_4x),
              const StrengthPassTextFild(),
              const VerticalSpace(vertical_spacing_10x),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is ChangePasswordErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      snackBarError(
                        context: context,
                        title: 'we are sorry!',
                        desc: state.errorText,
                      ),
                    );
                  } else if (state is ChangePasswordCompletedState) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  }
                },
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (PassTextFildAuth.passController.text ==
                            StrengthPassTextFild.passwordNotifire.value) {
                          BlocProvider.of<AuthBloc>(context).add(
                            ChangePasswordEvent(
                              newPassword:
                                  StrengthPassTextFild.passwordNotifire.value!,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            snackBarError(
                              context: context,
                              title: 'we are sorry!',
                              desc:
                                  'You made a mistake in repeating the new password!',
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      height: BUTTON_HEIGHTx2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color(0xff0867A3),
                          borderRadius: BorderRadius.circular(RADIUS_BUTTON3x)),
                      child: state is ChangePasswordLoadingState
                          ? const CupertinoActivityIndicator(color: WHITE_COLOR)
                          : const LargeBoldText(
                              'Change Password',
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

class StrengthPassTextFild extends StatefulWidget {
  const StrengthPassTextFild({
    super.key,
  });

  @override
  State<StrengthPassTextFild> createState() => _StrengthPassTextFildState();
  static ValueNotifier<double> strengthNotifire = ValueNotifier(0.0);
  static ValueNotifier<String?> passwordNotifire = ValueNotifier(null);
}

class _StrengthPassTextFildState extends State<StrengthPassTextFild> {
  bool isobscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(DEFULT_RADIUS_TEXTFILD),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: padding_Foreign1x,
                vertical: padding_Foreign3x,
              ),
              border: InputBorder.none,
              isDense: true,
              filled: true,
              fillColor: const Color(0xffEAF7FF),
              hintText: "Re-enter the new password",
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff69A6CD),
                fontFamily: defaultRegularFontName,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isobscure = !isobscure;
                  });
                },
                child: Icon(
                  isobscure ? Icons.visibility : Icons.visibility_off,
                  color: GRANITE_GRAY_COLOR,
                ),
              ),
            ),
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isobscure,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff302E43),
              fontFamily: defaultRegularFontName,
            ),
            onChanged: (value) {
              // Update the password

              StrengthPassTextFild.passwordNotifire.value = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'تکرار رمز عبور جدید را وارد کنید';
              }
              return null;
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ValueListenableBuilder(
                  valueListenable: StrengthPassTextFild.passwordNotifire,
                  builder: (context, value, child) {
                    return PasswordStrengthIndicator(
                      password: StrengthPassTextFild
                          .passwordNotifire.value, // Password to be evaluated
                      width: 10, // Change the width of the strength bar
                      thickness: 2, // Change the thickness of the strength bar
                      backgroundColor:
                          WHITE_COLOR, // Change the background color of the strength bar
                      radius: 2, // Change the radius of the strength bar
                      colors: const StrengthColors(
                        // Customize the colors of the strength bar
                        weak: Color(0xff38BF8E),
                        medium: Color(0xff38BF8E),
                        strong: Color(0xff38BF8E),
                      ),
                      duration: const Duration(
                          milliseconds: 300), // Set the animation duration
                      curve: Curves.easeOut, // Set the animation curve
                      callback: (double value) {
                        // Receive the strength value of the password
                        // print('Password Strength: $value');
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          StrengthPassTextFild.strengthNotifire.value = value;
                        });
                      },
                      strengthBuilder: (String password) {
                        // Implement a custom strength builder to calculate the strength based on your criteria
                        // Return a value between 0.0 (too weak) and 1.0 (very strong)
                        // Example:
                        return password.length / 10;
                      },
                      style: StrengthBarStyle
                          .dashed, // Choose a style for the strength bar
                    );
                  },
                ),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: StrengthPassTextFild.passwordNotifire,
              builder: (context, value, child) {
                return ValueListenableBuilder(
                  valueListenable: StrengthPassTextFild.strengthNotifire,
                  builder: (context, value, child) {
                    return SmallBoldText(
                      value == 0.0
                          ? ''
                          : value >= 0.1 && value < 1
                              ? 'ضعیف'
                              : value >= 1.0 && value < 1.9
                                  ? 'متوسط'
                                  : 'قوی',
                      textColorInLight: const Color(0xff02629F),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
