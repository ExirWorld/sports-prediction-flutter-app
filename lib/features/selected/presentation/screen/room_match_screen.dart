import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/constants.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/empty_container.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/features/nav_bar/main_screen.dart';
import 'package:oxir_game/features/selected/domain/entity/match_entity.dart';
import 'package:oxir_game/features/selected/presentation/bloc/selected_bloc.dart';
import 'package:oxir_game/features/selected/presentation/screen/timer_pie_chart_widget.dart';
import 'package:oxir_game/features/selected/presentation/screen/timer_text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RoomMatchScreen extends StatefulWidget {
  final MatchEntity matchEntity;
  final bool isTeamA;
  const RoomMatchScreen({
    super.key,
    required this.matchEntity,
    required this.isTeamA,
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

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<SelectedBloc, SelectedState>(
        buildWhen: (previous, current) {
          return current is GetRoomMatchCompleted ||
                  current is GetRoomMatchLoading ||
                  current is GetRoomMatchError
              ? true
              : false;
        },
        builder: (context, state) {
          if (state is GetRoomMatchCompleted) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            widget.isTeamA
                                ? '${Constants.baseUrl}${widget.matchEntity.teamAImageUrl}'
                                : '${Constants.baseUrl}${widget.matchEntity.teamBImageUrl}',
                            fit: BoxFit.cover,
                          ),
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 100,
                                      spreadRadius: 100,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.isTeamA
                                          ? widget.matchEntity.teamAName!
                                          : widget.matchEntity.teamBName!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      widget.matchEntity.leagueName!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const VerticalSpace(20),
                                    Text(
                                      widget.isTeamA
                                          ? widget.matchEntity.teamADesc!
                                          : widget.matchEntity.teamBDesc!,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const VerticalSpace(8),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          Icons.alarm,
                                          color: Colors.amber,
                                        ),
                                        const HorizontalSpace(8),
                                        CountdownTextWidget(
                                            targetTimestamp: widget.matchEntity
                                                .endOffsetUnixSecendTime!),
                                        // ValueListenableBuilder<String>(
                                        //   valueListenable:
                                        //       CountdownWidget.countdownNotifier,
                                        //   builder: (context, value, child) {
                                        //     return Text(
                                        //       value
                                        //           .replaceAll(' days ', 'd:')
                                        //           .replaceAll(' hours ', 'h:')
                                        //           .replaceAll(' minutes ', 'm:')
                                        //           .replaceAll('And ', '')
                                        //           .replaceAll(' seconds', 's'),
                                        //       style: const TextStyle(
                                        //           fontSize: 12,
                                        //           color: Colors.white),
                                        //     );
                                        //   },
                                        // ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Divider(color: Colors.grey.withOpacity(.5)),
                                    Row(
                                      children: [
                                        const Text(
                                          'Deposit:',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const HorizontalSpace(8),
                                        Image.asset(
                                          'assets/icons/coin.png',
                                          height: 18,
                                        ),
                                        const HorizontalSpace(4),
                                        Text(
                                          widget.isTeamA
                                              ? widget.matchEntity
                                                  .teamATokenDepositValue!
                                                  .toStringAsFixed(0)
                                              : widget.matchEntity
                                                  .teamBTokenDepositValue!
                                                  .toStringAsFixed(0),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(24),
                SizedBox(
                  height: 400,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: state.roomMatchEntity.length,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = state.roomMatchEntity[index];
                      final color1 =
                          data.roomMatchColor1!.replaceAll('#', '0xff');
                      final color2 =
                          data.roomMatchColor2!.replaceAll('#', '0xff');
                      final color3 =
                          data.roomMatchColor3!.replaceAll('#', '0xff');
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            child: Image.network(
                                              '${Constants.baseUrl}${data.roomMatchImageUrl!}',
                                              height: 150,
                                              width: 250,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const VerticalSpace(12),
                                          BigBoldText(
                                            data.roomMatchName!,
                                            textColorInLight: TEXT_LIGHT_COLOR,
                                          ),
                                          const VerticalSpace(12),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const NormalText(
                                                'Win:',
                                                textColorInLight: Colors.white,
                                              ),
                                              const HorizontalSpace(16),
                                              Image.asset(
                                                'assets/icons/coin.png',
                                                height: 24,
                                                width: 24,
                                              ),
                                              const HorizontalSpace(8),
                                              NormalText(
                                                data.winnerSeatValStr!,
                                                textColorInLight: Colors.white,
                                              ),
                                            ],
                                          ),
                                          const VerticalSpace(12),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const NormalText(
                                                'Lost:',
                                                textColorInLight: Colors.white,
                                              ),
                                              const HorizontalSpace(16),
                                              Image.asset(
                                                'assets/icons/coin.png',
                                                height: 24,
                                                width: 24,
                                              ),
                                              const HorizontalSpace(8),
                                              NormalText(
                                                data.looserSeatValStr!,
                                                textColorInLight: Colors.white,
                                              ),
                                            ],
                                          ),
                                          const VerticalSpace(24),
                                          const VerticalSpace(12),
                                          BlocConsumer<SelectedBloc,
                                              SelectedState>(
                                            listener: (context, state) {
                                              if (state
                                                  is AddPositionCompleted) {
                                                Navigator.pop(context);
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const MainScreen(),
                                                  ),
                                                );
                                              }
                                            },
                                            builder: (context, state) {
                                              return GestureDetector(
                                                onTap: () {
                                                  BlocProvider.of<SelectedBloc>(
                                                          context)
                                                      .add(
                                                    AddPositionEvent(
                                                      sportRef: widget
                                                          .matchEntity.sportRef
                                                          .toString(),
                                                      leagueRef: widget
                                                          .matchEntity.leagueRef
                                                          .toString(),
                                                      matchRef: widget
                                                          .matchEntity.matchsId
                                                          .toString(),
                                                      teamRef: widget.isTeamA
                                                          ? widget.matchEntity
                                                              .teamARef
                                                              .toString()
                                                          : widget.matchEntity
                                                              .teamBRef
                                                              .toString(),
                                                      roomRef: data.roomRef
                                                          .toString(),
                                                      roomMatchRef: data
                                                          .roomMatchId
                                                          .toString(),
                                                    ),
                                                  );
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
                                                  child: state
                                                          is AddPositionLoading
                                                      ? const CupertinoActivityIndicator(
                                                          color: WHITE_COLOR)
                                                      : const BigBoldText(
                                                          'Go Ahead',
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
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color(int.parse(color1)),
                                  Color(int.parse(color2)),
                                  Color(int.parse(color3)),
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    '${Constants.baseUrl}${data.roomMatchImageUrl!}',
                                    height: 150,
                                    width: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const VerticalSpace(16),
                                BigBoldText(
                                  data.roomName!,
                                  textColorInLight: TEXT_LIGHT_COLOR,
                                ),
                                NormalText(
                                  data.desc!,
                                  textColorInLight: TEXT_GRAY_EA_COLOR,
                                ),
                                const VerticalSpace(8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/coin.png',
                                      height: 25,
                                    ),
                                    const HorizontalSpace(8),
                                    SmallText(
                                      data.allTokenValueStr!,
                                      textColorInLight: TEXT_GRAY_EA_COLOR,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const VerticalSpace(16),
                SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: state.roomMatchEntity.length,
                  effect: const WormEffect(), // your preferred effect
                  onDotClicked: (index) {},
                ),
              ],
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(
                color: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}
