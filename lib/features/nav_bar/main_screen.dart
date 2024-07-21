import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/features/friends/presentation/screen/friends_screen.dart';
import 'package:oxir_game/features/selected/presentation/screen/sports_screen.dart';
import 'package:oxir_game/features/home/presentation/screen/home_screen.dart';
import 'package:oxir_game/features/nav_bar/nav_model.dart';
import 'package:oxir_game/features/nav_bar/navbar_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final echangeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  final airdropNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];

  @override
  void initState() {
    items = [
      NavModel(
        page: const HomeScreen(),
        navkey: airdropNavKey,
      ),
      NavModel(
        page: const SportsScreen(),
        navkey: searchNavKey,
      ),
      NavModel(
        page: const FriendsScreen(),
        navkey: notificationNavKey,
      ),
      NavModel(
        page: const Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: SmallText(
              'Profile 2',
              textColorInLight: TEXT_LIGHT_COLOR,
            ),
          ),
        ),
        navkey: profileNavKey,
      ),
      NavModel(
        page: const Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: SmallText(
              'Profile 3',
              textColorInLight: TEXT_LIGHT_COLOR,
            ),
          ),
        ),
        navkey: echangeNavKey,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navkey.currentState?.canPop() ?? false) {
          items[selectedTab].navkey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            IndexedStack(
              index: selectedTab,
              children: items
                  .map((page) => Navigator(
                        key: page.navkey,
                        onGenerateInitialRoutes: (navigator, initialRoute) {
                          return [
                            MaterialPageRoute(builder: (context) => page.page)
                          ];
                        },
                      ))
                  .toList(),
            ),
            NavBar(
              pageIndex: selectedTab,
              onTap: (index) {
                if (index == selectedTab) {
                  items[index]
                      .navkey
                      .currentState
                      ?.popUntil((route) => route.isFirst);
                } else {
                  setState(() {
                    selectedTab = index;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
