import 'package:flutter/material.dart';
import 'package:oxir_game/features/selected/domain/entity/sports_entity.dart';

@immutable
class SportsModel extends SportsEntity {
  const SportsModel({
    super.sportId,
    super.sportName,
    super.sportImageUrl,
    super.sportColor1,
    super.sportColor2,
    super.sportColor3,
    super.status,
    super.createDate,
  });

  factory SportsModel.fromJson(Map<String, dynamic> json) => SportsModel(
        sportId: json['sportId'] as int?,
        sportName: json['sportName'] as String?,
        sportImageUrl: json['sportImageUrl'] as String?,
        sportColor1: json['sportColor1'] as String?,
        sportColor2: json['sportColor2'] as String?,
        sportColor3: json['sportColor3'] as String?,
        status: json['status'] as int?,
        createDate: json['createDate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'sportId': sportId,
        'sportName': sportName,
        'sportImageUrl': sportImageUrl,
        'sportColor1': sportColor1,
        'sportColor2': sportColor2,
        'sportColor3': sportColor3,
        'status': status,
        'createDate': createDate,
      };
}
