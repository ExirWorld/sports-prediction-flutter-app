import 'package:flutter/material.dart';

@immutable
class RanksUsersList {
  final int? userRef;
  final String? userImageUrl;
  final String? userName;
  final bool? itsMe;

  const RanksUsersList({
    this.userRef,
    this.userImageUrl,
    this.userName,
    this.itsMe,
  });

  factory RanksUsersList.fromJson(Map<String, dynamic> json) {
    return RanksUsersList(
      userRef: json['userRef'] as int?,
      userImageUrl: json['userImageUrl'] as String?,
      userName: json['userName'] as String?,
      itsMe: json['itsMe'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'userRef': userRef,
        'userImageUrl': userImageUrl,
        'userName': userName,
        'itsMe': itsMe,
      };
}
