import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/customui/more/empty_container.dart';
import 'package:oxir_game/core/customui/more/margin_container.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/features/auth/presentation/screen/register/widget/button_register.dart';
import 'package:oxir_game/features/auth/presentation/screen/register/widget/category_widget.dart';
import 'package:oxir_game/features/auth/presentation/screen/register/widget/referal_register.dart';
import 'package:oxir_game/features/auth/presentation/screen/register/widget/referal_textfild_register.dart';
import 'package:oxir_game/features/auth/presentation/screen/register/widget/role_widget.dart';
import 'package:oxir_game/features/auth/presentation/widget/appbar_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/f_name_textfild_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/footer_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/name_textfild_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/pass_textfild_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/phone_textfild_auth.dart';
import 'package:oxir_game/features/auth/presentation/widget/storename_textfild_auth.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appBarAuth(context, true, title: 'Create Account'),
        body: SingleChildScrollView(
          child: HorizontalMarginContainer(
            margin: padding_Horizantalx,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const VerticalSpace(vertical_spacing_5x),

                  // تکست فیلد نام کاربری
                  const PhoneTextFildAuth(),
                  const VerticalSpace(vertical_spacing_4x),

                  // تکست فیلد رمز عبور
                  const PassTextFildAuth(),
                  const VerticalSpace(vertical_spacing_4x),

                  // تکست فیلد نام
                  const FNameTextFildAuth(),
                  const VerticalSpace(vertical_spacing_4x),

                  // تکست فیلد نام خانوادگی
                  const NameTextFildAuth(),
                  const VerticalSpace(vertical_spacing_4x),

                  // تکست فیلد نام فروشگاه
                  const StoreNameTextFild(),
                  const VerticalSpace(vertical_spacing_4x),

                  // // انتخاب دسته بندی
                  // const CategoryWidget(),
                  const VerticalSpace(vertical_spacing_4x),

                  // انتخاب نقش
                  ValueListenableBuilder(
                    valueListenable: CategoryList.categoryIdNotifire,
                    builder: (context, value, child) {
                      if (value == null) {
                        return const EmptyContainer();
                      } else {
                        return const RoleWidget();
                      }
                    },
                  ),

                  // شناسه معرف
                  const ReferalRegisterBox(),
                  const VerticalSpace(vertical_spacing_4x),

                  // تکست فیلد شناسه معرف
                  const ReferalTextFild(),
                  const VerticalSpace(vertical_spacing_6x),

                  // دکمه ثبت نام
                  ButtonRegister(formKey: formKey),

                  // فوتر
                  const FooterAuth(
                    title: 'Already have an account?',
                    titleLink: 'LogIn',
                    isToRegister: false,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
