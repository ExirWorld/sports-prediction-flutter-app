import 'package:flutter/material.dart';
import 'package:oxir_game/core/resources/entity/success_entity.dart';

@immutable
class SuccessModel extends SuccessEntity {
  const SuccessModel({super.msg, super.code});

  factory SuccessModel.fromJson(Map<String, dynamic> json) => SuccessModel(
        msg: json['msg'] as String?,
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'msg': msg,
        'code': code,
      };
}
