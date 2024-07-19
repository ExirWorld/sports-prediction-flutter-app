import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/features/friends/domain/entity/friends_entity.dart';
import 'package:oxir_game/features/friends/domain/repository/friends_repository.dart';

@singleton
class FriendsUsecase {
  final FriendsRepository friendsRepository;

  FriendsUsecase(this.friendsRepository);
  // دریافت دوستان که دعوت کرده ام
  Future<DataState<FriendsEntity>> getfriends() async {
    DataState<FriendsEntity> dataState = await friendsRepository.getfriends();
    return dataState;
  }
}
