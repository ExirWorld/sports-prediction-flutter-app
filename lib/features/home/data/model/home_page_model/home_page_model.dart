import 'package:flutter/material.dart';
import 'package:oxir_game/features/home/domain/entity/home_page_entity.dart';

import 'first_time_slider.dart';
import 'history_list.dart';
import 'ranks_header.dart';
import 'ranks_users_list.dart';

@immutable
class HomePageModel extends HomePageEntity {
  const HomePageModel({
    super.userName,
    super.userImageUrl,
    super.desc,
    super.myBalance,
    super.userFisrtTime,
    super.showUserPositionRanks,
    super.showUserHistory,
    super.ranksHeader,
    super.ranksUsersList,
    super.firstTimeSlider,
    super.historyList,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        userName: json['userName'] as String?,
        userImageUrl: json['userImageUrl'] as String?,
        desc: json['desc'] as String?,
        myBalance: json['myBalance'] as num?,
        userFisrtTime: json['userFisrtTime'] as bool?,
        showUserPositionRanks: json['showUserPositionRanks'] as bool?,
        showUserHistory: json['showUserHistory'] as bool?,
        ranksHeader: json['ranksHeader'] == null
            ? null
            : RanksHeader.fromJson(json['ranksHeader'] as Map<String, dynamic>),
        ranksUsersList: (json['ranksUsersList'] as List<dynamic>?)
            ?.map((e) => RanksUsersList.fromJson(e as Map<String, dynamic>))
            .toList(),
        firstTimeSlider: (json['firstTimeSlider'] as List<dynamic>?)
            ?.map((e) => FirstTimeSlider.fromJson(e as Map<String, dynamic>))
            .toList(),
        historyList: (json['historyList'] as List<dynamic>?)
            ?.map((e) => HistoryList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'userImageUrl': userImageUrl,
        'desc': desc,
        'myBalance': myBalance,
        'userFisrtTime': userFisrtTime,
        'showUserPositionRanks': showUserPositionRanks,
        'showUserHistory': showUserHistory,
        'ranksHeader': ranksHeader?.toJson(),
        'ranksUsersList': ranksUsersList?.map((e) => e.toJson()).toList(),
        'firstTimeSlider': firstTimeSlider?.map((e) => e.toJson()).toList(),
        'historyList': historyList?.map((e) => e.toJson()).toList(),
      };
}
