import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/constants.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/empty_container.dart';
import 'package:oxir_game/core/customui/more/margin_container.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/features/selected/presentation/bloc/selected_bloc.dart';

class RoomMatchScreen extends StatefulWidget {
  final String matchRef;
  final String sportRef;
  final String leagueRef;
  final String teamRef;
  final String imageTeamUrl;
  const RoomMatchScreen({
    super.key,
    required this.matchRef,
    required this.sportRef,
    required this.leagueRef,
    required this.teamRef,
    required this.imageTeamUrl,
  });

  @override
  State<RoomMatchScreen> createState() => _RoomMatchScreenState();
}

class _RoomMatchScreenState extends State<RoomMatchScreen> {
  @override
  void initState() {
    BlocProvider.of<SelectedBloc>(context)
        .add(GetRoomMatchEvent(matchRef: widget.matchRef));
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
            return HorizontalMarginContainer(
              margin: 16,
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        '${Constants.baseUrl}${widget.imageTeamUrl}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const VerticalSpace(24),
                  GridView.builder(
                    itemCount: state.roomMatchEntity.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 50,
                      crossAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      final data = state.roomMatchEntity[index];
                      final color1 =
                          data.roomMatchColor1!.replaceAll('#', '0xff');
                      final color2 =
                          data.roomMatchColor2!.replaceAll('#', '0xff');
                      final color3 =
                          data.roomMatchColor3!.replaceAll('#', '0xff');
                      return Container(
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
                                height: 75,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            NormalText(
                              data.roomName!,
                              textColorInLight: TEXT_LIGHT_COLOR,
                            ),
                            SmallText(
                              data.desc!,
                              textColorInLight: TEXT_GRAY_EA_COLOR,
                            ),
                            const VerticalSpace(12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/coin.png',
                                  height: 25,
                                ),
                                const HorizontalSpace(4),
                                SmallText(
                                  data.allTokenValueStr!,
                                  textColorInLight: TEXT_GRAY_EA_COLOR,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          } else {
            return const EmptyContainer();
          }
        },
      ),
    );
  }
}
