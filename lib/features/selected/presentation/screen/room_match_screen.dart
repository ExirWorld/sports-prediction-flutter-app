import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/features/selected/domain/entity/league_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/match_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/sports_entity.dart';
import 'package:oxir_game/features/selected/presentation/bloc/selected_bloc.dart';

class RoomMatchScreen extends StatefulWidget {
  final SportsEntity sportsEntity;
  final LeagueEntity leagueEntity;
  final MatchEntity matchEntity;
  const RoomMatchScreen(
      {super.key,
      required this.sportsEntity,
      required this.leagueEntity,
      required this.matchEntity});

  @override
  State<RoomMatchScreen> createState() => _RoomMatchScreenState();
}

class _RoomMatchScreenState extends State<RoomMatchScreen> {
  @override
  void initState() {
    BlocProvider.of<SelectedBloc>(context).add(
        GetRoomMatchEvent(matchRef: widget.matchEntity.matchsId.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
    );
  }
}
