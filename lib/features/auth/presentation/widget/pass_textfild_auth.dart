import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/fonts.dart';

class PassTextFildAuth extends StatefulWidget {
  const PassTextFildAuth({
    super.key,
  });

  @override
  State<PassTextFildAuth> createState() => _PassTextFildAuthState();
  static TextEditingController passController = TextEditingController();
}

class _PassTextFildAuthState extends State<PassTextFildAuth> {
  bool isobscure = true;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(DEFULT_RADIUS_TEXTFILD),
      child: TextFormField(
        controller: PassTextFildAuth.passController,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.visiblePassword,
        obscureText: isobscure,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontFamily: defaultRegularFontName,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: padding_Foreign1x,
            vertical: padding_Foreign3x,
          ),
          border: InputBorder.none,
          isDense: true,
          filled: true,
          fillColor: const Color(0xff272a2f),
          hintText: "Enter your password",
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff888b90),
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter your password';
          }
          return null;
        },
      ),
    );
  }
}
