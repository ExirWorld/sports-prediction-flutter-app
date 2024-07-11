import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/locator/di/di.dart';
import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/core/resources/entity/error_entity.dart';
import 'package:oxir_game/core/resources/model/error_model.dart';
import 'package:oxir_game/features/selected/data/data_source/api_selected.dart';
import 'package:oxir_game/features/selected/data/model/league_model.dart';
import 'package:oxir_game/features/selected/data/model/match_model.dart';
import 'package:oxir_game/features/selected/data/model/room_match_model.dart';
import 'package:oxir_game/features/selected/data/model/sports_model.dart';
import 'package:oxir_game/features/selected/domain/entity/league_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/match_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/room_match_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/sports_entity.dart';
import 'package:oxir_game/features/selected/domain/repository/selected_repository.dart';

@Singleton(as: SelectedRepository, env: [Env.prod])
class SelectedRepositoryImpl extends SelectedRepository {
  final ApiSelected apiSelected;

  SelectedRepositoryImpl(this.apiSelected);

  @override
  Future<DataState<List<LeagueEntity>>> getLeagues(String sportRef) async {
    try {
      Response response = await apiSelected.getLeagues(sportRef);
      List<LeagueEntity> leagueEntity = List<LeagueEntity>.from(
          response.data.map((model) => LeagueModel.fromJson(model)));
      return DataSuccess(leagueEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<List<MatchEntity>>> getMatch(
      String sportRef, String leagueRef) async {
    try {
      Response response = await apiSelected.getMatch(sportRef, leagueRef);
      List<MatchEntity> matchEntity = List<MatchEntity>.from(
          response.data.map((model) => MatchModel.fromJson(model)));
      return DataSuccess(matchEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<List<RoomMatchEntity>>> getRoomMatch(String matchRef) async {
    try {
      Response response = await apiSelected.getRoomMatch(matchRef);
      List<RoomMatchEntity> roomMatchEntity = List<RoomMatchEntity>.from(
          response.data.map((model) => RoomMatchModel.fromJson(model)));
      return DataSuccess(roomMatchEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }

  @override
  Future<DataState<List<SportsEntity>>> getSports() async {
    try {
      Response response = await apiSelected.getSports();
      List<SportsEntity> sportsEntity = List<SportsEntity>.from(
          response.data.map((model) => SportsModel.fromJson(model)));
      return DataSuccess(sportsEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }
}
