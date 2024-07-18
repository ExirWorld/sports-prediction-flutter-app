import 'package:equatable/equatable.dart';

class LeagueEntity extends Equatable {
  final int? leagueId;
  final int? sportRef;
  final String? leagueName;
  final String? leagueImageUrl;
  final String? leagueColor1;
  final String? leagueColor2;
  final String? leagueColor3;
  final int? status;
  final String? createDate;

  const LeagueEntity({
    this.leagueId,
    this.sportRef,
    this.leagueName,
    this.leagueImageUrl,
    this.leagueColor1,
    this.leagueColor2,
    this.leagueColor3,
    this.status,
    this.createDate,
  });

  @override
  List<Object?> get props => [
        leagueId,
        sportRef,
        leagueName,
        leagueImageUrl,
        leagueColor1,
        leagueColor2,
        leagueColor3,
        status,
        createDate
      ];
}
