import 'package:flutter/material.dart';
import 'package:oxir_game/features/selected/domain/entity/add_position_entity.dart';

@immutable
class AddPositionModel extends AddPositionEntity {
  const AddPositionModel({
    super.positionId,
    super.sportRef,
    super.leagueRef,
    super.matchRef,
    super.teamRef,
    super.roomRef,
    super.roomMatchRef,
    super.roomPositionNumber,
    super.userRef,
    super.userTransActionRef,
    super.status,
    super.createDate,
  });

  factory AddPositionModel.fromJson(Map<String, dynamic> json) {
    return AddPositionModel(
      positionId: json['positionId'] as int?,
      sportRef: json['sportRef'] as int?,
      leagueRef: json['leagueRef'] as int?,
      matchRef: json['matchRef'] as int?,
      teamRef: json['teamRef'] as int?,
      roomRef: json['roomRef'] as int?,
      roomMatchRef: json['roomMatchRef'] as int?,
      roomPositionNumber: json['roomPositionNumber'] as int?,
      userRef: json['userRef'] as int?,
      userTransActionRef: json['userTransActionRef'] as int?,
      status: json['status'] as int?,
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'positionId': positionId,
        'sportRef': sportRef,
        'leagueRef': leagueRef,
        'matchRef': matchRef,
        'teamRef': teamRef,
        'roomRef': roomRef,
        'roomMatchRef': roomMatchRef,
        'roomPositionNumber': roomPositionNumber,
        'userRef': userRef,
        'userTransActionRef': userTransActionRef,
        'status': status,
        'createDate': createDate?.toIso8601String(),
      };
}
