import 'package:equatable/equatable.dart';
import 'package:oxir_game/features/home/data/model/home_page_model/first_time_slider.dart';
import 'package:oxir_game/features/home/data/model/home_page_model/history_list.dart';
import 'package:oxir_game/features/home/data/model/home_page_model/ranks_header.dart';
import 'package:oxir_game/features/home/data/model/home_page_model/ranks_users_list.dart';

class HomePageEntity extends Equatable {
  final String? userName;
  final String? userImageUrl;
  final String? desc;
  final int? myBalance;
  final bool? userFisrtTime;
  final bool? showUserPositionRanks;
  final bool? showUserHistory;
  final RanksHeader? ranksHeader;
  final List<RanksUsersList>? ranksUsersList;
  final List<FirstTimeSlider>? firstTimeSlider;
  final List<HistoryList>? historyList;

  const HomePageEntity(
      {this.userName,
      this.userImageUrl,
      this.desc,
      this.myBalance,
      this.userFisrtTime,
      this.showUserPositionRanks,
      this.showUserHistory,
      this.ranksHeader,
      this.ranksUsersList,
      this.firstTimeSlider,
      this.historyList});

  @override
  List<Object?> get props => [
        userName,
        userImageUrl,
        desc,
        myBalance,
        userFisrtTime,
        showUserPositionRanks,
        showUserHistory,
        ranksHeader,
        ranksUsersList,
        firstTimeSlider,
        historyList
      ];
}
