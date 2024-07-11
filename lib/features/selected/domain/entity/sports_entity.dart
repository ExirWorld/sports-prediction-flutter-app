import 'package:equatable/equatable.dart';

class SportsEntity extends Equatable {
  final int? sportId;
  final String? sportName;
  final String? sportImageUrl;
  final String? sportColor;
  final int? status;
  final String? createDate;

  const SportsEntity({
    this.sportId,
    this.sportName,
    this.sportImageUrl,
    this.sportColor,
    this.status,
    this.createDate,
  });

  @override
  List<Object?> get props =>
      [sportId, sportName, sportImageUrl, sportColor, status, createDate];
}
