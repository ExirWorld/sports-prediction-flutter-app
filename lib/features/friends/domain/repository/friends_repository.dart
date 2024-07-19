import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/features/friends/domain/entity/friends_entity.dart';

abstract class FriendsRepository {
  // دریافت دوستان که دعوت کرده ام
  Future<DataState<FriendsEntity>> getfriends();
}
