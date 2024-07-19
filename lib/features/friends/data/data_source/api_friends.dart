import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiFriends {
  final Dio httpclient;

  ApiFriends(this.httpclient);

  // دریافت دوستان که دعوت کرده ام
  Future<dynamic> getfriends() async {
    final resposne = await httpclient.post('Play/Refarals');
    return resposne;
  }
}
