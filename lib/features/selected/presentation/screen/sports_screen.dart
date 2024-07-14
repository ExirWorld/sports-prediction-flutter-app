import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/constants.dart';
import 'package:oxir_game/core/customui/more/margin_container.dart';
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
            children: [
              const SizedBox(
                height: 8,
              ),
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
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        final data = state.sportsEntity[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LeagueScreen(
                                    sportsEntity: data,
                                  ),
                                ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                '${Constants.baseUrl}${data.sportImageUrl!}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
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
