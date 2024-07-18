import 'package:flutter/material.dart';
import 'package:oxir_game/features/selected/domain/entity/room_match_entity.dart';

@immutable
class RoomMatchModel extends RoomMatchEntity {
  const RoomMatchModel({
    super.roomMatchId,
    super.roomRef,
    super.roomName,
    super.roomImageUrl,
    super.roomMatchName,
    super.roomMatchImageUrl,
    super.roomMatchColor1,
    super.roomMatchColor2,
    super.roomMatchColor3,
    super.allTokenValueStr,
    super.tokenDepositValue,
    super.seatCount,
    super.winnerSeatVal,
    super.looserSeatVal,
    super.status,
    super.desc,
    super.createDate,
  });

  factory RoomMatchModel.fromJson(Map<String, dynamic> json) {
    return RoomMatchModel(
      roomMatchId: json['roomMatchId'] as int?,
      roomRef: json['roomRef'] as int?,
      roomName: json['roomName'] as String?,
      roomImageUrl: json['roomImageUrl'] as String?,
      roomMatchName: json['roomMatchName'] as String?,
      roomMatchImageUrl: json['roomMatchImageUrl'] as String?,
      roomMatchColor1: json['roomMatchColor1'] as String?,
      roomMatchColor2: json['roomMatchColor2'] as String?,
      roomMatchColor3: json['roomMatchColor3'] as String?,
      allTokenValueStr: json['allTokenValueStr'] as String?,
      tokenDepositValue: json['tokenDepositValue'] as num?,
      seatCount: json['seatCount'] as int?,
      winnerSeatVal: json['winnerSeatVal'] as num?,
      looserSeatVal: json['looserSeatVal'] as num?,
      status: json['status'] as int?,
      desc: json['desc'] as String?,
      createDate: json['createDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'roomMatchId': roomMatchId,
        'roomRef': roomRef,
        'roomName': roomName,
        'roomImageUrl': roomImageUrl,
        'roomMatchName': roomMatchName,
        'roomMatchImageUrl': roomMatchImageUrl,
        'roomMatchColor1': roomMatchColor1,
        'roomMatchColor2': roomMatchColor2,
        'roomMatchColor3': roomMatchColor3,
        'allTokenValueStr': allTokenValueStr,
        'tokenDepositValue': tokenDepositValue,
        'seatCount': seatCount,
        'winnerSeatVal': winnerSeatVal,
        'looserSeatVal': looserSeatVal,
        'status': status,
        'desc': desc,
        'createDate': createDate,
      };
}
