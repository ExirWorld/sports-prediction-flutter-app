import 'package:oxir_game/core/resources/data_state.dart';
import 'package:oxir_game/features/home/domain/entity/home_page_entity.dart';

abstract class HomePageRepository {
  // دریافت اطلاعات صفحه خانه
  Future<DataState<HomePageEntity>> getHomePage();
}
