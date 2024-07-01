import 'package:flutter/material.dart';
import 'package:oxir_game/features/auth/domain/entity/rulls_entity.dart';

@immutable
class RullsModel extends RullsEntity {
  const RullsModel({
    super.rullsId,
    super.categoriesRef,
    super.rullName,
    super.rullsUrl,
    super.createdDate,
    super.isActive,
  });

  factory RullsModel.fromJson(Map<String, dynamic> json) => RullsModel(
        rullsId: json['rullsId'] as int?,
        categoriesRef: json['categoriesRef'] as int?,
        rullName: json['rullName'] as String?,
        rullsUrl: json['rullsUrl'] as String?,
        createdDate: json['createdDate'] as String?,
        isActive: json['isActive'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'rullsId': rullsId,
        'categoriesRef': categoriesRef,
        'rullName': rullName,
        'rullsUrl': rullsUrl,
        'createdDate': createdDate,
        'isActive': isActive,
      };
}
