import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiHomePage {
  final Dio httpclient;

  ApiHomePage(this.httpclient);

  // دریافت اطلاعات صفحه خانه
  Future<dynamic> getHomePage() async {
    final resposne = await httpclient.post('Play/HomePage');
    return resposne;
  }
}
