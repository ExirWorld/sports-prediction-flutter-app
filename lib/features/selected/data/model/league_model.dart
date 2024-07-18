import 'package:flutter/material.dart';
import 'package:oxir_game/features/selected/domain/entity/league_entity.dart';

@immutable
class LeagueModel extends LeagueEntity {
  const LeagueModel({
    super.leagueId,
    super.sportRef,
    super.leagueName,
    super.leagueImageUrl,
    super.leagueColor1,
    super.leagueColor2,
    super.leagueColor3,
    super.status,
    super.createDate,
  });

  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
        leagueId: json['leagueId'] as int?,
        sportRef: json['sportRef'] as int?,
        leagueName: json['leagueName'] as String?,
        leagueImageUrl: json['leagueImageUrl'] as String?,
        leagueColor1: json['leagueColor1'] as String?,
        leagueColor2: json['leagueColor2'] as String?,
        leagueColor3: json['leagueColor3'] as String?,
        status: json['status'] as int?,
        createDate: json['createDate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'leagueId': leagueId,
        'sportRef': sportRef,
        'leagueName': leagueName,
        'leagueImageUrl': leagueImageUrl,
        'leagueColor1': leagueColor1,
        'leagueColor2': leagueColor2,
        'leagueColor3': leagueColor3,
        'status': status,
        'createDate': createDate,
      };
}
