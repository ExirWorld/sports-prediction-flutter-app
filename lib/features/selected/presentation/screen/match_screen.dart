import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/constants.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/features/nav_bar/main_screen.dart';
import 'package:oxir_game/features/selected/domain/entity/league_entity.dart';
import 'package:oxir_game/features/selected/domain/entity/sports_entity.dart';
import 'package:oxir_game/features/selected/presentation/bloc/selected_bloc.dart';
import 'package:oxir_game/features/selected/presentation/screen/room_match_screen.dart';
import 'package:oxir_game/features/selected/presentation/screen/test.dart';
import 'package:oxir_game/features/selected/presentation/screen/timer_pie_chart_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

  final PageController pageController = PageController();
  static ValueNotifier<int> pageIndex = ValueNotifier(0);
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
                      // return Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //             builder: (context) => RoomMatchScreen(
                      //               sportsEntity: widget.sportsEntity,
                      //               leagueEntity: widget.leagueEntity,
                      //               matchEntity: data,
                      //               teamRef: 0,
                      //             ),
                      //           ));
                      //       Navigator.pop(context);
                      //     },
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //       children: [
                      //         Expanded(
                      //           child: Container(
                      //             height:
                      //                 MediaQuery.of(context).size.height / 3,
                      //             decoration: const BoxDecoration(
                      //               color: Colors.red,
                      //             ),
                      //             alignment: Alignment.center,
                      //             child: Text(data.teamAName!),
                      //           ),
                      //         ),
                      //         Expanded(
                      //           child: Container(
                      //             height:
                      //                 MediaQuery.of(context).size.height / 3,
                      //             decoration: const BoxDecoration(
                      //               color: Colors.blue,
                      //             ),
                      //             alignment: Alignment.center,
                      //             child: Text(data.teamBName!),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // );

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                ),
                              ),
                              backgroundColor: WHITE_COLOR,
                              elevation: 0,
                              useRootNavigator: true,
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xff1b1f24),
                                        border: Border(
                                          top: BorderSide(
                                            color: Color(0xffe9c475),
                                          ),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(255, 97, 70, 11),
                                            spreadRadius: 1,
                                            blurRadius: 20,
                                            offset: Offset(0, -15),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 30),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 450,
                                            child: PageView.builder(
                                              itemCount: 2,
                                              scrollDirection: Axis.horizontal,
                                              controller: pageController,
                                              onPageChanged: (value) {
                                                pageIndex.value = value;
                                              },
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: index == 0
                                                          ? Image.network(
                                                              '${Constants.baseUrl}${data.teamAImageUrl!}',
                                                              height: 125,
                                                              width: 125,
                                                            )
                                                          : Image.network(
                                                              '${Constants.baseUrl}${data.teamBImageUrl!}',
                                                              height: 125,
                                                              width: 125,
                                                            ),
                                                    ),
                                                    const VerticalSpace(12),
                                                    SizedBox(
                                                      width: 300,
                                                      child: Center(
                                                        child:
                                                            RatingBar.builder(
                                                          itemSize: 35,
                                                          ignoreGestures: true,
                                                          initialRating: index ==
                                                                  0
                                                              ? double.parse(data
                                                                  .teamAStars
                                                                  .toString())
                                                              : double.parse(data
                                                                  .teamBStars
                                                                  .toString()),
                                                          minRating: 1,
                                                          direction:
                                                              Axis.horizontal,
                                                          allowHalfRating: true,
                                                          itemCount: 5,
                                                          itemPadding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      4.0),
                                                          itemBuilder:
                                                              (context, _) =>
                                                                  const Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                          onRatingUpdate:
                                                              (rating) {},
                                                        ),
                                                      ),
                                                    ),
                                                    const VerticalSpace(12),
                                                    BigBoldText(
                                                      index == 0
                                                          ? data.teamAName!
                                                          : data.teamBName!,
                                                      textColorInLight:
                                                          TEXT_LIGHT_COLOR,
                                                    ),
                                                    const VerticalSpace(12),
                                                    CountdownWidget(
                                                      targetTimestamp: data
                                                          .endOffsetUnixSecendTime!,
                                                      chartCreationTimestamp: data
                                                          .startOffsetUnixSecendTime!,
                                                    ),
                                                    const VerticalSpace(12),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          'assets/icons/coin.png',
                                                          height: 24,
                                                          width: 24,
                                                        ),
                                                        const HorizontalSpace(
                                                            8),
                                                        NormalText(
                                                          index == 0
                                                              ? data
                                                                  .teamATokenDepositValue!
                                                                  .toStringAsFixed(
                                                                      0)
                                                              : data
                                                                  .teamBTokenDepositValue!
                                                                  .toStringAsFixed(
                                                                      0),
                                                          textColorInLight:
                                                              Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                    const VerticalSpace(24),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                          SmoothPageIndicator(
                                            controller:
                                                pageController, // PageController
                                            count: 2,
                                            effect:
                                                const WormEffect(), // your preferred effect
                                            onDotClicked: (index) {},
                                          ),
                                          const VerticalSpace(12),
                                          ValueListenableBuilder(
                                            valueListenable: pageIndex,
                                            builder: (context, value, child) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              RoomMatchScreen(
                                                                matchEntity:
                                                                    data,
                                                                isTeamA:
                                                                    value == 0
                                                                        ? true
                                                                        : false,
                                                              )));
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .7,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: BigBoldText(
                                                    value == 0
                                                        ? '${data.teamAName} wins'
                                                        : '${data.teamBName} wins',
                                                    textColorInLight:
                                                        TEXT_LIGHT_COLOR,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: DiagonalImagesContainer(
                            image1: data.teamAImageUrl!,
                            image2: data.teamBImageUrl!,
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
