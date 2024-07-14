import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/customui/more/empty_container.dart';
import 'package:oxir_game/features/selected/domain/entity/league_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/match_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/sports_entity.dart';
import 'package:oxir_game/features/selected/presentation/bloc/selected_bloc.dart';

class RoomMatchScreen extends StatefulWidget {
  final SportsEntity sportsEntity;
  final LeagueEntity leagueEntity;
  final MatchEntity matchEntity;
  final int teamRef;
  const RoomMatchScreen({
    super.key,
    required this.sportsEntity,
    required this.leagueEntity,
    required this.matchEntity,
    required this.teamRef,
  });

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
      body: BlocBuilder<SelectedBloc, SelectedState>(
        builder: (context, state) {
          if (state is GetRoomMatchCompleted) {
            return Column(
              children: [
                CarouselSlider(
                    items: state.roomMatchEntity.map(
                      (e) {
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              backgroundColor: WHITE_COLOR,
                              elevation: 0,
                              useRootNavigator: true,
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<SelectedBloc>(context)
                                              .add(
                                            AddPositionEvent(
                                              sportRef: widget
                                                  .sportsEntity.sportId
                                                  .toString(),
                                              leagueRef: widget
                                                  .leagueEntity.leagueId
                                                  .toString(),
                                              matchRef: widget
                                                  .matchEntity.matchsId
                                                  .toString(),
                                              teamRef:
                                                  widget.teamRef.toString(),
                                              roomRef: e.roomRef.toString(),
                                              roomMatchRef:
                                                  e.roomMatchId.toString(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            color: Colors.amber,
                            alignment: Alignment.center,
                            child: Text(e.roomName!),
                          ),
                        );
                      },
                    ).toList(),
                    options: CarouselOptions(
                      height: 700,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {},
                      scrollDirection: Axis.horizontal,
                    ))
              ],
            );
          } else {
            return const EmptyContainer();
          }
        },
      ),
    );
  }
}
