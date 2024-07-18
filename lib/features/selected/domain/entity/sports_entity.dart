import 'package:equatable/equatable.dart';

class SportsEntity extends Equatable {
  final int? sportId;
  final String? sportName;
  final String? sportImageUrl;
  final String? sportColor1;
  final String? sportColor2;
  final String? sportColor3;
  final int? status;
  final String? createDate;

  const SportsEntity({
    this.sportId,
    this.sportName,
    this.sportImageUrl,
    this.sportColor1,
    this.sportColor2,
    this.sportColor3,
    this.status,
    this.createDate,
  });

  @override
  List<Object?> get props => [
        sportId,
        sportName,
        sportImageUrl,
        sportColor1,
        sportColor2,
        sportColor3,
        status,
        createDate
      ];
}
