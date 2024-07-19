import 'package:flutter/material.dart';
import 'package:oxir_game/features/friends/domain/entity/friends_entity.dart';

import 'referals_list.dart';

@immutable
class FriendsModel extends FriendsEntity {
  const FriendsModel({
    super.id,
    super.tokenName,
    super.refferalEarnToken,
    super.singnUpInvateLinkEarnToken,
    super.myLink,
    super.referalsList,
  });

  factory FriendsModel.fromJson(Map<String, dynamic> json) => FriendsModel(
        id: json['id'] as int?,
        tokenName: json['tokenName'] as String?,
        refferalEarnToken: json['refferalEarnToken'] as String?,
        singnUpInvateLinkEarnToken:
            json['singnUpInvateLinkEarnToken'] as String?,
        myLink: json['myLink'] as String?,
        referalsList: (json['referalsList'] as List<dynamic>?)
            ?.map((e) => ReferalsList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'tokenName': tokenName,
        'refferalEarnToken': refferalEarnToken,
        'singnUpInvateLinkEarnToken': singnUpInvateLinkEarnToken,
        'myLink': myLink,
        'referalsList': referalsList?.map((e) => e.toJson()).toList(),
      };
}
