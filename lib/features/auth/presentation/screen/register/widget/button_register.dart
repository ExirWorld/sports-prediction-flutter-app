import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/notifications/snackbar_error.dart';
import 'package:oxir_game/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:oxir_game/features/auth/presentation/screen/register/widget/category_widget.dart';
import 'package:oxir_game/features/auth/presentation/screen/register/widget/referal_textfild_register.dart';
import 'package:oxir_game/features/auth/presentation/screen/register/widget/role_widget.dart';
import 'package:oxir_game/features/auth/presentation/widget/f_name_textfild_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/name_textfild_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/pass_textfild_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/phone_textfild_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/storename_textfild_auth.dart';
import 'package:oxir_game/features/nav_bar/main_screen.dart';

class ButtonRegister extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const ButtonRegister({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      duration: const Duration(milliseconds: 100),
      scaleFactor: 1.5,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          BlocProvider.of<AuthBloc>(context).add(RegisterEvent(
            mobileNumber: PhoneTextFildAuth.phoneController.text,
            password: PassTextFildAuth.passController.text,
            storeName: StoreNameTextFild.storeController.text,
            name: NameTextFildAuth.nameController.text,
            fName: FNameTextFildAuth.fNameController.text,
            referalCode: ReferalTextFild.referalController.text,
            rullId: '-1',
            categoriesId: '-1',
          ));
        }
      },
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              snackBarError(
                context: context,
                title: 'we are sorry!',
                desc: state.errorText,
              ),
            );
          } else if (state is RegisterCompletedState) {
            BlocProvider.of<AuthBloc>(context).add(
              LoginUserEvent(
                userName: PhoneTextFildAuth.phoneController.text,
                password: PassTextFildAuth.passController.text,
              ),
            );
          } else if (state is LoginUserCompletedState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ));
          } else if (state is LoginUserErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              snackBarError(
                context: context,
                title: 'we are sorry!',
                desc: state.errorText,
              ),
            );
          }
        },
        builder: (context, state) {
          return Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xff5c60ff),
              borderRadius: BorderRadius.circular(RADIUS_BUTTON3x),
            ),
            alignment: Alignment.center,
            child:
                state is RegisterLoadingState || state is LoginUserLoadingState
                    ? const CupertinoActivityIndicator(color: WHITE_COLOR)
                    : const LargeBoldText(
                        'Register',
                        textColorInLight: TEXT_LIGHT_COLOR,
                      ),
          );
        },
      ),
    );
  }
}
