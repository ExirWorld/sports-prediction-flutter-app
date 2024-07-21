import 'package:flutter/material.dart';

@immutable
class RanksHeader {
  final int? positionId;
  final String? sportName;
  final String? sportImageUrl;
  final String? leagueName;
  final String? leagueImageUrl;
  final String? matchStartDate;
  final String? matchEndDate;
  final int? offsetUnixSecendTime;
  final String? teamName;
  final String? teamImageUrl;
  final String? roomName;
  final String? roomImageUrl;
  final int? roomPositionNumber;
  final int? roomAllPlayerCount;
  final String? tokenDepositValue;
  final String? allTokenValue;
  final int? seatCount;
  final String? winnerSeatVal;
  final String? looserSeatVal;

  const RanksHeader({
    this.positionId,
    this.sportName,
    this.sportImageUrl,
    this.leagueName,
    this.leagueImageUrl,
    this.matchStartDate,
    this.matchEndDate,
    this.offsetUnixSecendTime,
    this.teamName,
    this.teamImageUrl,
    this.roomName,
    this.roomImageUrl,
    this.roomPositionNumber,
    this.roomAllPlayerCount,
    this.tokenDepositValue,
    this.allTokenValue,
    this.seatCount,
    this.winnerSeatVal,
    this.looserSeatVal,
  });

  factory RanksHeader.fromJson(Map<String, dynamic> json) => RanksHeader(
        positionId: json['positionId'] as int?,
        sportName: json['sportName'] as String?,
        sportImageUrl: json['sportImageUrl'] as String?,
        leagueName: json['leagueName'] as String?,
        leagueImageUrl: json['leagueImageUrl'] as String?,
        matchStartDate: json['matchStartDate'] as String?,
        matchEndDate: json['matchEndDate'] as String?,
        offsetUnixSecendTime: json['offsetUnixSecendTime'] as int?,
        teamName: json['teamName'] as String?,
        teamImageUrl: json['teamImageUrl'] as String?,
        roomName: json['roomName'] as String?,
        roomImageUrl: json['roomImageUrl'] as String?,
        roomPositionNumber: json['roomPositionNumber'] as int?,
        roomAllPlayerCount: json['roomAllPlayerCount'] as int?,
        tokenDepositValue: json['tokenDepositValue'] as String?,
        allTokenValue: json['allTokenValue'] as String?,
        seatCount: json['seatCount'] as int?,
        winnerSeatVal: json['winnerSeatVal'] as String?,
        looserSeatVal: json['looserSeatVal'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'positionId': positionId,
        'sportName': sportName,
        'sportImageUrl': sportImageUrl,
        'leagueName': leagueName,
        'leagueImageUrl': leagueImageUrl,
        'matchStartDate': matchStartDate,
        'matchEndDate': matchEndDate,
        'offsetUnixSecendTime': offsetUnixSecendTime,
        'teamName': teamName,
        'teamImageUrl': teamImageUrl,
        'roomName': roomName,
        'roomImageUrl': roomImageUrl,
        'roomPositionNumber': roomPositionNumber,
        'roomAllPlayerCount': roomAllPlayerCount,
        'tokenDepositValue': tokenDepositValue,
        'allTokenValue': allTokenValue,
        'seatCount': seatCount,
        'winnerSeatVal': winnerSeatVal,
        'looserSeatVal': looserSeatVal,
      };
}
