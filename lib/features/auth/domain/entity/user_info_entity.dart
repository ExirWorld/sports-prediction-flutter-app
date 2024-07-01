import 'package:equatable/equatable.dart';

class UserInfoEntity extends Equatable {
  final int? userId;
  final String? userName;
  final String? passwordHash;
  final String? mobileNumber;
  final String? name;
  final String? fName;
  final String? referalCode;
  final String? fingerPrint;
  final bool? fingerPrintActive;
  final bool? twoFactorIsActive;
  final DateTime? createdDate;
  final bool? isActive;

  const UserInfoEntity({
    this.userId,
    this.userName,
    this.passwordHash,
    this.mobileNumber,
    this.name,
    this.fName,
    this.referalCode,
    this.fingerPrint,
    this.fingerPrintActive,
    this.twoFactorIsActive,
    this.createdDate,
    this.isActive,
  });

  @override
  List<Object?> get props => [
        userId,
        userName,
        passwordHash,
        mobileNumber,
        name,
        fName,
        referalCode,
        fingerPrint,
        fingerPrintActive,
        twoFactorIsActive,
        createdDate,
        isActive
      ];
}
