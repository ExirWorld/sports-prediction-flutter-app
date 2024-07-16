import 'package:equatable/equatable.dart';

class MatchEntity extends Equatable {
  final int? matchsId;
  final int? sportRef;
  final int? leagueRef;
  final int? teamARef;
  final int? teamBRef;
  final String? sportName;
  final String? leagueName;
  final String? teamAName;
  final String? teamBName;
  final String? teamAImageUrl;
  final String? teamBImageUrl;
  final String? teamADesc;
  final String? teamBDesc;
  final int? teamAStars;
  final int? teamBStars;
  final num? teamATokenDepositValue;
  final num? teamBTokenDepositValue;
  final String? matchDate;
  final String? matchStartDate;
  final int? endOffsetUnixSecendTime;
  final int? startOffsetUnixSecendTime;
  final String? matchEndDate;
  final bool? matchEnded;
  final dynamic palyedDate;
  final bool? isPlayed;
  final String? desc;
  final int? status;
  final String? createDate;

  const MatchEntity({
    this.matchsId,
    this.sportRef,
    this.leagueRef,
    this.teamARef,
    this.teamBRef,
    this.sportName,
    this.leagueName,
    this.teamAName,
    this.teamBName,
    this.teamAImageUrl,
    this.teamBImageUrl,
    this.teamADesc,
    this.teamBDesc,
    this.teamAStars,
    this.teamBStars,
    this.teamATokenDepositValue,
    this.teamBTokenDepositValue,
    this.matchDate,
    this.matchStartDate,
    this.endOffsetUnixSecendTime,
    this.startOffsetUnixSecendTime,
    this.matchEndDate,
    this.matchEnded,
    this.palyedDate,
    this.isPlayed,
    this.desc,
    this.status,
    this.createDate,
  });

  @override
  List<Object?> get props => [
        matchsId,
        sportRef,
        leagueRef,
        teamARef,
        teamBRef,
        sportName,
        leagueName,
        teamAName,
        teamBName,
        teamAImageUrl,
        teamBImageUrl,
        teamADesc,
        teamBDesc,
        teamAStars,
        teamBStars,
        teamATokenDepositValue,
        teamBTokenDepositValue,
        matchDate,
        matchStartDate,
        endOffsetUnixSecendTime,
        startOffsetUnixSecendTime,
        matchEndDate,
        matchEnded,
        palyedDate,
        isPlayed,
        desc,
        status,
        createDate,
      ];
}
