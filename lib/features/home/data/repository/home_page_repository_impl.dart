import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/locator/di/di.dart';
import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/core/resources/entity/error_entity.dart';
import 'package:oxir_game/core/resources/model/error_model.dart';
import 'package:oxir_game/features/home/data/data_source/api_home_page.dart';
import 'package:oxir_game/features/home/data/model/home_page_model/home_page_model.dart';
import 'package:oxir_game/features/home/domain/entity/home_page_entity.dart';
import 'package:oxir_game/features/home/domain/repository/home_page_repository.dart';

@Singleton(as: HomePageRepository, env: [Env.prod])
class HomePageRepositoryImpl extends HomePageRepository {
  final ApiHomePage apiHomePage;

  HomePageRepositoryImpl(this.apiHomePage);
  @override
  Future<DataState<HomePageEntity>> getHomePage() async {
    try {
      final Response response = await apiHomePage.getHomePage();
      HomePageEntity friendsEntity = HomePageModel.fromJson(response.data);
      return DataSuccess(friendsEntity);
    } on DioException catch (e) {
      ErrorEntity errorEntity = ErrorModel.fromJson(e.response!.data);
      return DataFailed(errorEntity.message!);
    }
  }
}
