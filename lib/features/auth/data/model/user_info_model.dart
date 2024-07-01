import 'package:flutter/material.dart';
import 'package:oxir_game/features/auth/domain/entity/user_info_entity.dart';

@immutable
class UserInfoModel extends UserInfoEntity {
  const UserInfoModel({
    super.userId,
    super.userName,
    super.passwordHash,
    super.mobileNumber,
    super.name,
    super.fName,
    super.referalCode,
    super.fingerPrint,
    super.fingerPrintActive,
    super.twoFactorIsActive,
    super.createdDate,
    super.isActive,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        userId: json['userId'] as int?,
        userName: json['userName'] as String?,
        passwordHash: json['passwordHash'] as String?,
        mobileNumber: json['mobileNumber'] as String?,
        name: json['name'] as String?,
        fName: json['fName'] as String?,
        referalCode: json['referalCode'] as String?,
        fingerPrint: json['fingerPrint'] as String?,
        fingerPrintActive: json['fingerPrintActive'] as bool?,
        twoFactorIsActive: json['twoFactorIsActive'] as bool?,
        createdDate: json['createdDate'] == null
            ? null
            : DateTime.parse(json['createdDate'] as String),
        isActive: json['isActive'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'passwordHash': passwordHash,
        'mobileNumber': mobileNumber,
        'name': name,
        'fName': fName,
        'referalCode': referalCode,
        'fingerPrint': fingerPrint,
        'fingerPrintActive': fingerPrintActive,
        'twoFactorIsActive': twoFactorIsActive,
        'createdDate': createdDate?.toIso8601String(),
        'isActive': isActive,
      };
}
