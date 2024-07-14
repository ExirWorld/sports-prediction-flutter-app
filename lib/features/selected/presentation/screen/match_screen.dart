import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/features/nav_bar/main_screen.dart';
import 'package:oxir_game/features/selected/domain/entity/league_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/sports_entity.dart';
import 'package:oxir_game/features/selected/presentation/bloc/selected_bloc.dart';
import 'package:oxir_game/features/selected/presentation/screen/room_match_screen.dart';

class MatchScreen extends StatefulWidget {
  final SportsEntity sportsEntity;
  final LeagueEntity leagueEntity;
  const MatchScreen(
      {super.key, required this.sportsEntity, required this.leagueEntity});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  void initState() {
    BlocProvider.of<SelectedBloc>(context).add(GetMatchEvent(
        sportRef: widget.sportsEntity.sportId.toString(),
        leagueRef: widget.leagueEntity.leagueId.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: BlocConsumer<SelectedBloc, SelectedState>(
        listener: (context, state) {
          if (state is AddPositionCompleted) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ));
          }
        },
        buildWhen: (previous, current) {
          return current is GetMatchCompleted ||
                  current is GetMatchError ||
                  current is GetMatchLoading
              ? true
              : false;
        },
        builder: (context, state) {
          if (state is GetMatchCompleted) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: state.matchEntity.length,
                    itemBuilder: (context, index) {
                      final data = state.matchEntity[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RoomMatchScreen(
                                    sportsEntity: widget.sportsEntity,
                                    leagueEntity: widget.leagueEntity,
                                    matchEntity: data,
                                    teamRef: 0,
                                  ),
                                ));
                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(data.teamAName!),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(data.teamBName!),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
