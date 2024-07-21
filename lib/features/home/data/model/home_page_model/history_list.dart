import 'package:flutter/material.dart';

@immutable
class HistoryList {
  final int? positionResualtId;
  final String? userName;
  final String? roomName;
  final String? matchEndDate;
  final String? userPositionDate;
  final int? positionNumber;
  final String? userTeamName;
  final String? winnerTeamName;
  final num? deposidToken;
  final bool? winner;
  final num? earnedToken;
  final num? loosedToken;
  final num? cashBackToken;

  const HistoryList({
    this.positionResualtId,
    this.userName,
    this.roomName,
    this.matchEndDate,
    this.userPositionDate,
    this.positionNumber,
    this.userTeamName,
    this.winnerTeamName,
    this.deposidToken,
    this.winner,
    this.earnedToken,
    this.loosedToken,
    this.cashBackToken,
  });

  factory HistoryList.fromJson(Map<String, dynamic> json) => HistoryList(
        positionResualtId: json['positionResualtId'] as int?,
        userName: json['userName'] as String?,
        roomName: json['roomName'] as String?,
        matchEndDate: json['matchEndDate'] as String?,
        userPositionDate: json['userPositionDate'] as String?,
        positionNumber: json['positionNumber'] as int?,
        userTeamName: json['userTeamName'] as String?,
        winnerTeamName: json['winnerTeamName'] as String?,
        deposidToken: json['deposidToken'] as num?,
        winner: json['winner'] as bool?,
        earnedToken: json['earnedToken'] as num?,
        loosedToken: json['loosedToken'] as num?,
        cashBackToken: json['cashBackToken'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'positionResualtId': positionResualtId,
        'userName': userName,
        'roomName': roomName,
        'matchEndDate': matchEndDate,
        'userPositionDate': userPositionDate,
        'positionNumber': positionNumber,
        'userTeamName': userTeamName,
        'winnerTeamName': winnerTeamName,
        'deposidToken': deposidToken,
        'winner': winner,
        'earnedToken': earnedToken,
        'loosedToken': loosedToken,
        'cashBackToken': cashBackToken,
      };
}
