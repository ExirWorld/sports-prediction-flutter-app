import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiSelected {
  final Dio httpclient;

  ApiSelected(this.httpclient);

  // دریافت لیست ورزش ها
  Future<dynamic> getSports() async {
    final resposne = await httpclient.post('Play/Sports');
    return resposne;
  }

  // دریافت لیست لیگ ها
  Future<dynamic> getLeagues(String sportRef) async {
    final resposne =
        await httpclient.post('Play/League', data: {"sportRef": sportRef});
    return resposne;
  }

  // دریافت لیست بازی ها
  Future<dynamic> getMatch(String sportRef, String leagueRef) async {
    final resposne = await httpclient.post('Play/Match',
        data: {"sportRef": sportRef, "leagueRef": leagueRef});
    return resposne;
  }

  // دریافت لیست اتاق های بازی
  Future<dynamic> getRoomMatch(String matchRef) async {
    final resposne =
        await httpclient.post('Play/RoomMatch', data: {"matchRef": matchRef});
    return resposne;
  }
}
