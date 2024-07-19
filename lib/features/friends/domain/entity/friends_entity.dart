import 'package:equatable/equatable.dart';
import 'package:oxir_game/features/friends/data/model/friends_model/referals_list.dart';

class FriendsEntity extends Equatable {
  final int? id;
  final String? tokenName;
  final String? refferalEarnToken;
  final String? singnUpInvateLinkEarnToken;
  final String? myLink;
  final List<ReferalsList>? referalsList;

  const FriendsEntity(
      {this.id,
      this.tokenName,
      this.refferalEarnToken,
      this.singnUpInvateLinkEarnToken,
      this.myLink,
      this.referalsList});

  @override
  List<Object?> get props => [
        id,
        tokenName,
        refferalEarnToken,
        singnUpInvateLinkEarnToken,
        myLink,
        referalsList
      ];
}
