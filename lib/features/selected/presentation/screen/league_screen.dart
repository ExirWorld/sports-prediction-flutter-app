import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/constants.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/margin_container.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/features/selected/domain/entity/sports_entity.dart';
import 'package:oxir_game/features/selected/presentation/bloc/selected_bloc.dart';
import 'package:oxir_game/features/selected/presentation/screen/match_screen.dart';

class LeagueScreen extends StatefulWidget {
  final SportsEntity sportsEntity;
  const LeagueScreen({super.key, required this.sportsEntity});

  @override
  State<LeagueScreen> createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  @override
  void initState() {
    BlocProvider.of<SelectedBloc>(context)
        .add(GetLeaguesEvent(sportRef: widget.sportsEntity.sportId.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            child: HorizontalMarginContainer(
              margin: 12,
              child: BlocBuilder<SelectedBloc, SelectedState>(
                buildWhen: (previous, current) {
                  return current is GetLeaguesCompleted ||
                          current is GetLeaguesError ||
                          current is GetLeaguesLoading
                      ? true
                      : false;
                },
                builder: (context, state) {
                  if (state is GetLeaguesCompleted) {
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.leagueEntity.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final data = state.leagueEntity[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 28),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MatchScreen(
                                          sportsEntity: widget.sportsEntity,
                                          leagueEntity: data,
                                        ),
                                      ));
                                },
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
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
                                            offset: Offset(0, -10),
                                          ),
                                        ],
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(24),
                                          topRight: Radius.circular(24),
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(24),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              '${Constants.baseUrl}${data.leagueImageUrl!}',
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              CircularProgressIndicator(
                                                  value: downloadProgress
                                                      .progress),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -35,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(24)),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 30, sigmaY: 30),
                                          child: Container(
                                            height: 75,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              border: Border.all(
                                                  color: Colors.white
                                                      .withOpacity(0.2),
                                                  width: 1),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(25),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: SmallText(
                                              data.leagueName!,
                                              textColorInLight:
                                                  TEXT_LIGHT_COLOR,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const VerticalSpace(120),
                      ],
                    );
                  } else {
                    return const Center(
                        child: CupertinoActivityIndicator(
                      color: WHITE_COLOR,
                    ));
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
