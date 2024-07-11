import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/features/selected/domain/entity/league_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/match_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/room_match_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/sports_entity.dart';
import 'package:oxir_game/features/selected/domain/repository/selected_repository.dart';

@singleton
class SelectedUsecase {
  final SelectedRepository selectedRepository;

  SelectedUsecase(this.selectedRepository);

  // دریافت لیست ورزش ها
  Future<DataState<List<SportsEntity>>> getSports() async {
    DataState<List<SportsEntity>> dataState =
        await selectedRepository.getSports();
    return dataState;
  }

  // دریافت لیست لیگ ها
  Future<DataState<List<LeagueEntity>>> getLeagues(String sportRef) async {
    DataState<List<LeagueEntity>> dataState =
        await selectedRepository.getLeagues(sportRef);
    return dataState;
  }

  // دریافت لیست بازی ها
  Future<DataState<List<MatchEntity>>> getMatch(
      String sportRef, String leagueRef) async {
    DataState<List<MatchEntity>> dataState =
        await selectedRepository.getMatch(sportRef, leagueRef);
    return dataState;
  }

  // دریافت لیست اتاق های بازی
  Future<DataState<List<RoomMatchEntity>>> getRoomMatch(String matchRef) async {
    DataState<List<RoomMatchEntity>> dataState =
        await selectedRepository.getRoomMatch(matchRef);
    return dataState;
  }
}
