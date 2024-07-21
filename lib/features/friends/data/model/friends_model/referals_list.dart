import 'package:flutter/material.dart';

@immutable
class ReferalsList {
  final int? userReferalsId;
  final String? userName;
  final DateTime? userJoineddate;
  final num? depositedTokenValue;
  final String? createdDate;

  const ReferalsList({
    this.userReferalsId,
    this.userName,
    this.userJoineddate,
    this.depositedTokenValue,
    this.createdDate,
  });

  factory ReferalsList.fromJson(Map<String, dynamic> json) => ReferalsList(
        userReferalsId: json['userReferalsId'] as int?,
        userName: json['userName'] as String?,
        userJoineddate: json['userJoineddate'] == null
            ? null
            : DateTime.parse(json['userJoineddate'] as String),
        depositedTokenValue: json['depositedTokenValue'] as num?,
        createdDate: json['createdDate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userReferalsId': userReferalsId,
        'userName': userName,
        'userJoineddate': userJoineddate?.toIso8601String(),
        'depositedTokenValue': depositedTokenValue,
        'createdDate': createdDate,
      };
}
