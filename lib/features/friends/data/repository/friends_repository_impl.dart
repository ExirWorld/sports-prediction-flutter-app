import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/locator/di/di.dart';
import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/core/resources/entity/error_entity.dart';
import 'package:oxir_game/core/resources/model/error_model.dart';
import 'package:oxir_game/features/friends/data/data_source/api_friends.dart';
import 'package:oxir_game/features/friends/data/model/friends_model/friends_model.dart';
import 'package:oxir_game/features/friends/domain/entity/friends_entity.dart';
import 'package:oxir_game/features/friends/domain/repository/friends_repository.dart';

@Singleton(as: FriendsRepository, env: [Env.prod])
class FriendsRepositoryImpl extends FriendsRepository {
  final ApiFriends apiFriends;

  FriendsRepositoryImpl(this.apiFriends);
  @override
  Future<DataState<FriendsEntity>> getfriends() async {
    try {
      final Response response = await apiFriends.getfriends();
      FriendsEntity friendsEntity = FriendsModel.fromJson(response.data);
      return DataSuccess(friendsEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }
}
