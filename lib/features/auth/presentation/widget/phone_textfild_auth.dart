import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/fonts.dart';

class PhoneTextFildAuth extends StatelessWidget {
  const PhoneTextFildAuth({
    super.key,
  });
  static TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(DEFULT_RADIUS_TEXTFILD),
      child: TextFormField(
        controller: phoneController,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.phone,
        maxLength: 11,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        buildCounter: (context,
                {required currentLength,
                required isFocused,
                required maxLength}) =>
            null,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: padding_Foreign1x),
          border: InputBorder.none,
          filled: true,
          fillColor: Color(0xff272a2f),
          hintText: "Enter the mobile number",
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff888b90),
            fontFamily: defaultRegularFontName,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter the mobile number';
          }
          return null;
        },
      ),
    );
  }
}
