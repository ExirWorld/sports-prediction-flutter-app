import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/features/selected/domain/entity/league_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/match_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/room_match_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/sports_entity.dart';

abstract class SelectedRepository {
  // دریافت لیست ورزش ها
  Future<DataState<List<SportsEntity>>> getSports();

  // دریافت لیست لیگ ها
  Future<DataState<List<LeagueEntity>>> getLeagues(String sportRef);

  // دریافت لیست بازی ها
  Future<DataState<List<MatchEntity>>> getMatch(
      String sportRef, String leagueRef);

  // دریافت لیست اتاق های بازی
  Future<DataState<List<RoomMatchEntity>>> getRoomMatch(String matchRef);
}
