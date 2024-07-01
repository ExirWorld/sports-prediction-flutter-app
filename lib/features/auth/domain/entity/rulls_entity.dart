import 'package:equatable/equatable.dart';

class RullsEntity extends Equatable {
  final int? rullsId;
  final int? categoriesRef;
  final String? rullName;
  final String? rullsUrl;
  final String? createdDate;
  final bool? isActive;

  const RullsEntity({
    this.rullsId,
    this.categoriesRef,
    this.rullName,
    this.rullsUrl,
    this.createdDate,
    this.isActive,
  });

  @override
  List<Object?> get props =>
      [rullsId, categoriesRef, rullName, rullsUrl, createdDate, isActive];
}
