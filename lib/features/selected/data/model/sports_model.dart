import 'package:flutter/material.dart';
import 'package:oxir_game/features/selected/domain/entity/sports_entity.dart';

@immutable
class SportsModel extends SportsEntity {
  const SportsModel({
    super.sportId,
    super.sportName,
    super.sportImageUrl,
    super.sportColor,
    super.status,
    super.createDate,
  });

  factory SportsModel.fromJson(Map<String, dynamic> json) => SportsModel(
        sportId: json['sportId'] as int?,
        sportName: json['sportName'] as String?,
        sportImageUrl: json['sportImageUrl'] as String?,
        sportColor: json['sportColor'] as String?,
        status: json['status'] as int?,
        createDate: json['createDate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'sportId': sportId,
        'sportName': sportName,
        'sportImageUrl': sportImageUrl,
        'sportColor': sportColor,
        'status': status,
        'createDate': createDate,
      };
}
