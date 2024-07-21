import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/constants.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/margin_container.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';
import 'package:oxir_game/features/selected/presentation/bloc/selected_bloc.dart';
import 'package:oxir_game/features/selected/presentation/screen/league_screen.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({super.key});

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  @override
  void initState() {
    BlocProvider.of<SelectedBloc>(context).add(GetSportsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: HorizontalMarginContainer(
        margin: 12,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BigBoldText(
                'choose your sport',
                
                textColorInLight: Colors.white,
              ),
              const VerticalSpace(24),
              BlocBuilder<SelectedBloc, SelectedState>(
                buildWhen: (previous, current) {
                  return current is GetSportsCompleted ||
                          current is GetSportsLoading ||
                          current is GetSportsError
                      ? true
                      : false;
                },
                builder: (context, state) {
                  if (state is GetSportsCompleted) {
                    return GridView.builder(
                      itemCount: state.sportsEntity.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 50,
                        crossAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        final data = state.sportsEntity[index];
                        return data.status == 1
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LeagueScreen(
                                          sportsEntity: data,
                                        ),
                                      ));
                                },
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '${Constants.baseUrl}${data.sportImageUrl!}',
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        fit: BoxFit.cover,
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
                                                2.2,
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
                                              data.sportName!,
                                              textColorInLight:
                                                  TEXT_LIGHT_COLOR,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.bottomCenter,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          '${Constants.baseUrl}${data.sportImageUrl!}',
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      fit: BoxFit.cover,
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
                                              2.2,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.1),
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
                                            data.sportName!,
                                            textColorInLight: TEXT_LIGHT_COLOR,
                                          ),
                                        ),
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
                                            sigmaX: 1, sigmaY: 1),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .26,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.2,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
