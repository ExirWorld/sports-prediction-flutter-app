import 'package:equatable/equatable.dart';

class AddPositionEntity extends Equatable {
  final int? positionId;
  final int? sportRef;
  final int? leagueRef;
  final int? matchRef;
  final int? teamRef;
  final int? roomRef;
  final int? roomMatchRef;
  final int? roomPositionNumber;
  final int? userRef;
  final int? userTransActionRef;
  final int? status;
  final DateTime? createDate;

  const AddPositionEntity({
    this.positionId,
    this.sportRef,
    this.leagueRef,
    this.matchRef,
    this.teamRef,
    this.roomRef,
    this.roomMatchRef,
    this.roomPositionNumber,
    this.userRef,
    this.userTransActionRef,
    this.status,
    this.createDate,
  });

  @override
  List<Object?> get props => [
        positionId,
        sportRef,
        leagueRef,
        matchRef,
        teamRef,
        roomRef,
        roomMatchRef,
        roomPositionNumber,
        userRef,
        userTransActionRef,
        status,
        createDate,
      ];
}
