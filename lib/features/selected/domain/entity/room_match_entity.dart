import 'package:equatable/equatable.dart';

class RoomMatchEntity extends Equatable {
  final int? roomMatchId;
  final int? roomRef;
  final String? roomName;
  final String? roomImageUrl;
  final String? roomMatchName;
  final String? roomMatchImageUrl;
  final String? roomMatchColor;
  final num? allTokenValue;
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
    this.roomMatchColor,
    this.allTokenValue,
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
        roomMatchColor,
        allTokenValue,
        tokenDepositValue,
        seatCount,
        winnerSeatVal,
        looserSeatVal,
        status,
        desc,
        createDate,
      ];
}
