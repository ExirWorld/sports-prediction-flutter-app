import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/core/customui/more/empty_container.dart';
import 'package:oxir_game/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:oxir_game/features/selected/presentation/screen/sports_screen.dart';
import 'package:oxir_game/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _coins = 20000535;
  int _energy = 6000;
  @override
  void initState() {
    BlocProvider.of<HomePageBloc>(context).add(HomePageStartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _appbar(),
      body: SingleChildScrollView(
        child: BlocBuilder<HomePageBloc, HomePageState>(
          buildWhen: (previous, current) {
            return current is HomePageCompleted ||
                    current is HomePageError ||
                    current is HomePageLoading
                ? true
                : false;
          },
          builder: (context, state) {
            if (state is HomePageCompleted) {
              if (!state.homePageEntity.userFisrtTime!) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      _titleInfo(),
                      Expanded(
                        child: Center(
                          child: AnimatedButton(
                            height: 70,
                            width: 200,
                            text: 'Start Game',
                            isReverse: true,
                            selectedTextColor: Colors.black,
                            transitionType: TransitionType.LEFT_TO_RIGHT,
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            backgroundColor: Colors.black,
                            borderColor: Colors.white,
                            borderRadius: 50,
                            borderWidth: 2,
                            animationDuration: const Duration(seconds: 1),
                            onPress: () {
                              Timer.periodic(
                                const Duration(seconds: 1),
                                (timer) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SportsScreen(),
                                      ));
                                  timer.cancel();
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _titleInfo(),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 16),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(
                            color: const Color(0xffe9c475),
                            width: .05,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Assets.icons.exirplus.image(height: 40),
                            Container(
                              width: .5,
                              color: Colors.white24,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Profit per tap',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xffaf7c64),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Assets.icons.coin
                                        .image(width: 25, height: 25),
                                    const SizedBox(width: 3),
                                    const Text(
                                      '+2.14M',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 3),
                                    Assets.icons.info
                                        .image(height: 25, width: 25),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: .5,
                              color: Colors.white24,
                            ),
                            Assets.icons.setting
                                .image(height: 40, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    _contentInfo(
                      context,
                      _coins,
                      _energy,
                      () {
                        setState(() {
                          _coins = _coins + 10;
                          _energy = _energy - 10;
                        });
                      },
                    ),
                  ],
                );
              }
            } else if (state is HomePageLoading) {
              return SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                    child: CupertinoActivityIndicator(color: Colors.white)),
              );
            } else if (state is HomePageError) {
              return SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SmallBoldText(
                    state.errorText,
                    textColorInLight: Colors.white,
                  ),
                ),
              );
            } else {
              return const EmptyContainer();
            }
          },
        ),
      ),
    );
  }
}

PreferredSize _appbar() {
  return PreferredSize(
      preferredSize: const Size.fromHeight(55),
      child: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Exir Game',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: const Icon(
          Icons.close,
          color: Colors.white,
          size: 30,
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 25,
          )
        ],
      ));
}

Widget _titleInfo() {
  return Container(
    height: 70,
    margin: const EdgeInsets.only(left: 10, right: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xff262422),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset('assets/icons/exirplus.png'),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ART PROGRAMER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'CEO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _contentInfo(
  BuildContext context,
  int coin,
  int energy,
  VoidCallback onTap,
) {
  return Container(
    height: MediaQuery.of(context).size.height,
    decoration: const BoxDecoration(
      color: Color(0xff1b1f24),
      border: Border(
        top: BorderSide(
          color: Color(0xffe9c475),
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 97, 70, 11),
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
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: 275,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        // _titleContentInfo(),

        // const SizedBox(
        //   height: 30,
        // ),
        // _countCoinContentInfo(coin),

        // const SizedBox(
        //   height: 20,
        // ),
        // _buttonPoints(context, () {
        //   onTap();
        // }),
        // const SizedBox(
        //   height: 16,
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 24),
        //   child: Row(
        //     children: [
        //       Assets.icons.lightning.image(height: 25, width: 25),
        //       const SizedBox(
        //         width: 8,
        //       ),
        //       const Text(
        //         '10000 / 10000',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.w700,
        //         ),
        //       ),
        //       const Spacer(),
        //       Assets.icons.rocket.image(height: 25, width: 25),
        //       const SizedBox(
        //         width: 8,
        //       ),
        //       const Text(
        //         'Boost',
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.w700,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // const SizedBox(
        //   height: 120,
        // ),
        // _energyContentInfo(energy),
      ],
    ),
  );
}

// Widget _titleContentInfo() {
//   return SizedBox(
//     height: 52,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: const Color(0xff282a30),
//         ),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 4,
//             ),
//             const Text(
//               'Profit per tap',
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Color(0xffaf7c64),
//               ),
//             ),
//             const SizedBox(
//               height: 2,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/icons/airdrop.png',
//                   height: 20,
//                   width: 20,
//                 ),
//                 const SizedBox(width: 3),
//                 const Text(
//                   'Coins for apa',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Color(0xff7277ff),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 2,
//                 ),
//                 const Text(
//                   '100 M',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }

Widget _countCoinContentInfo(int coin) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Assets.icons.coin.image(
        height: 70,
        width: 70,
      ),
      const SizedBox(
        width: 15,
      ),
      Text(
        coin.toString().spaceSeparateNumbers(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.w700,
        ),
      )
    ],
  );
}

Widget _buttonPoints(BuildContext context, VoidCallback onTap) {
  return GestureDetector(
    onTapDown: (position) {
      _getTapPosition(position, context);
      onTap();
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.width - 50,
          width: MediaQuery.of(context).size.width - 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff515ad8),
                Color(0xff1b232c),
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.width - 90,
          width: MediaQuery.of(context).size.width - 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            gradient: const RadialGradient(
              colors: [
                Color(0xff272f43),
                Color(0xff2c3d7b),
                Color(0xff1b232c),
              ],
              center: Alignment.center,
              radius: 0.6,
            ),
          ),
          child: Assets.images.hamster.image(),
        ),
      ],
    ),
  );
}

void _getTapPosition(
  TapDownDetails tapPosition,
  BuildContext context,
) {
  Offset position = Offset.zero;
  final RenderBox refrenceBox = context.findRenderObject() as RenderBox;
  position = refrenceBox.globalToLocal(tapPosition.globalPosition);
  // Point().showOverlay(context, position);
}

extension StringNumberExtension on String {
  String spaceSeparateNumbers() {
    final result = replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ');
    return result;
  }
}
