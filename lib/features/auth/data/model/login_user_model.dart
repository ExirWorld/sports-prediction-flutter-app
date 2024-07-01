import 'package:flutter/material.dart';
import 'package:oxir_game/features/auth/domain/entity/login_user_entity.dart';

@immutable
class LoginUserModel extends LoginUserEntity {
  const LoginUserModel({super.token, super.expireTime});

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      token: json['token'] as String?,
      expireTime: json['expireTime'] == null
          ? null
          : DateTime.parse(json['expireTime'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'expireTime': expireTime?.toIso8601String(),
      };
}
