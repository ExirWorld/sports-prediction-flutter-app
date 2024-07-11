import 'package:equatable/equatable.dart';

class LeagueEntity extends Equatable {
  final int? leagueId;
  final int? sportRef;
  final String? leagueName;
  final String? leagueImageUrl;
  final String? leagueColor;
  final int? status;
  final String? createDate;

  const LeagueEntity({
    this.leagueId,
    this.sportRef,
    this.leagueName,
    this.leagueImageUrl,
    this.leagueColor,
    this.status,
    this.createDate,
  });

  @override
  List<Object?> get props => [
        leagueId,
        sportRef,
        leagueName,
        leagueImageUrl,
        leagueColor,
        status,
        createDate
      ];
}
