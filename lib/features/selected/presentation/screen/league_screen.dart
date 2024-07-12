import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: HorizontalMarginContainer(
        margin: 12,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<SelectedBloc, SelectedState>(
                buildWhen: (previous, current) {
                  return current is GetLeaguesCompleted ||
                          current is GetLeaguesError ||
                          current is GetLeaguesLoading
                      ? true
                      : false;
                },
                builder: (context, state) {
                  if (state is GetLeaguesCompleted) {
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
                            height: 275,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            alignment: Alignment.center,
                            child: Text(data.leagueName!),
                          ),
                        );
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
