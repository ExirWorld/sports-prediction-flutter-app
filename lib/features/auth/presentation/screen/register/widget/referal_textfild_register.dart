import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/fonts.dart';
import 'package:oxir_game/core/customui/more/empty_container.dart';
import 'package:oxir_game/features/auth/presentation/screen/register/widget/referal_register.dart';

class ReferalTextFild extends StatelessWidget {
  const ReferalTextFild({
    super.key,
  });
  static TextEditingController referalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ReferalRegisterBox.checkBoxNotifire,
      builder: (context, value, child) {
        return value
            ? ClipRRect(
                borderRadius: BorderRadius.circular(DEFULT_RADIUS_TEXTFILD),
                child: TextFormField(
                  controller: referalController,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: padding_Foreign1x),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xff272a2f),
                    hintText: "Enter the identifier",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff888b90),
                      fontFamily: defaultRegularFontName,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the identifier';
                    }
                    return null;
                  },
                ),
              )
            : const EmptyContainer();
      },
    );
  }
}
