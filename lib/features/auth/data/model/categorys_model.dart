import 'package:flutter/material.dart';
import 'package:oxir_game/features/auth/domain/entity/categorys_entity.dart';

@immutable
class CategorysModel extends CategorysEntity {
  const CategorysModel({
    super.categoryId,
    super.categoryName,
    super.categoryUrl,
  });

  factory CategorysModel.fromJson(Map<String, dynamic> json) {
    return CategorysModel(
      categoryId: json['categoryId'] as int?,
      categoryName: json['categoryName'] as String?,
      categoryUrl: json['categoryUrl'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'categoryId': categoryId,
        'categoryName': categoryName,
        'categoryUrl': categoryUrl,
      };
}
