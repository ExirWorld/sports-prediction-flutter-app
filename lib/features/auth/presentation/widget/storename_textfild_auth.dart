import 'package:flutter/material.dart';

import 'package:oxir_game/core/common/dimens.dart';
import 'package:oxir_game/core/common/fonts.dart';

class StoreNameTextFild extends StatelessWidget {
  const StoreNameTextFild({
    super.key,
  });
  static TextEditingController storeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(DEFULT_RADIUS_TEXTFILD),
      child: TextFormField(
        controller: storeController,
        textAlign: TextAlign.start,
        keyboardType: TextInputType.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontFamily: defaultRegularFontName,
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: padding_Foreign1x),
          border: InputBorder.none,
          filled: true,
          fillColor: Color(0xff272a2f),
          hintText: "Enter the name of the store",
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff888b90),
            fontFamily: defaultRegularFontName,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter the name of the store';
          }
          return null;
        },
      ),
    );
  }
}
