import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxir_game/core/common/constants.dart';
import 'package:oxir_game/core/customui/more/margin_container.dart';
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
      body: HorizontalMarginContainer(
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
              if (state.leagueEntity.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.leagueEntity.length,
                  itemBuilder: (context, index) {
                    final data = state.leagueEntity[index];
                    return GestureDetector(
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
                      child: Container(
                        margin: const EdgeInsets.only(top: 24),
                        height: 275,
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.network(
                            '${Constants.baseUrl}${data.leagueImageUrl!}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: SvgPicture.asset(
                    'assets/images/forgetfulness.svg',
                  ),
                );
              }
            } else {
              return Center(
                child: SvgPicture.asset(
                  'assets/images/forgetfulness.svg',
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
