import 'package:injectable/injectable.dart';
import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/features/home/domain/entity/home_page_entity.dart';
import 'package:oxir_game/features/home/domain/repository/home_page_repository.dart';

@singleton
class HomePageUsecase {
  final HomePageRepository homePageRepository;

  HomePageUsecase(this.homePageRepository);
  // دریافت اطلاعات صفحه خانه
  Future<DataState<HomePageEntity>> getHomePage() async {
    DataState<HomePageEntity> dataState =
        await homePageRepository.getHomePage();
    return dataState;
  }
}
