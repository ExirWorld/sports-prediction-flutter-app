import 'package:equatable/equatable.dart';

class RoomMatchEntity extends Equatable {
  final int? roomMatchId;
  final int? roomRef;
  final String? roomName;
  final String? roomImageUrl;
  final String? roomMatchName;
  final String? roomMatchImageUrl;
  final String? roomMatchColor1;
  final String? roomMatchColor2;
  final String? roomMatchColor3;
  final String? allTokenValueStr;
  final num? tokenDepositValue;
  final int? seatCount;
  final num? winnerSeatVal;
  final num? looserSeatVal;
  final int? status;
  final String? desc;
  final String? createDate;

  const RoomMatchEntity({
    this.roomMatchId,
    this.roomRef,
    this.roomName,
    this.roomImageUrl,
    this.roomMatchName,
    this.roomMatchImageUrl,
    this.roomMatchColor1,
    this.roomMatchColor2,
    this.roomMatchColor3,
    this.allTokenValueStr,
    this.tokenDepositValue,
    this.seatCount,
    this.winnerSeatVal,
    this.looserSeatVal,
    this.status,
    this.desc,
    this.createDate,
  });

  @override
  List<Object?> get props => [
        roomMatchId,
        roomRef,
        roomName,
        roomImageUrl,
        roomMatchName,
        roomMatchImageUrl,
        roomMatchColor1,
        roomMatchColor2,
        roomMatchColor3,
        allTokenValueStr,
        tokenDepositValue,
        seatCount,
        winnerSeatVal,
        looserSeatVal,
        status,
        desc,
        createDate,
      ];
}
