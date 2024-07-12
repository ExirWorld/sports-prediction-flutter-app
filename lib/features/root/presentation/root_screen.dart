import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/colors.dart';
import 'package:oxir_game/core/common/text_widgets.dart';
import 'package:oxir_game/features/selected/presentation/screen/sports_screen.dart';
import 'package:oxir_game/features/home/home_screen.dart';

const int homeIndex = 0;
const int cartIndex = 1;
const int profileIndex = 2;
const int zIndex = 3;

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _cartKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();
  final GlobalKey<NavigatorState> _zKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    cartIndex: _cartKey,
    profileIndex: _profileKey,
    zIndex: _zKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: IndexedStack(
            index: selectedScreenIndex,
            children: [
              _navigator(_homeKey, homeIndex, const HomeScreen()),
              _navigator(_cartKey, cartIndex, const SportsScreen()),
              _navigator(
                  _profileKey,
                  profileIndex,
                  const Scaffold(
                    backgroundColor: Colors.black,
                    body: Center(
                      child: SmallText(
                        'Profile',
                        textColorInLight: TEXT_LIGHT_COLOR,
                      ),
                    ),
                  )),
              _navigator(
                  _zKey,
                  zIndex,
                  const Scaffold(
                    backgroundColor: Colors.black,
                    body: Center(
                      child: SmallText(
                        'Profile 2',
                        textColorInLight: TEXT_LIGHT_COLOR,
                      ),
                    ),
                  )),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            elevation: 3,
            backgroundColor: const Color(0xff272a2f),
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xff4d4e50),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), label: 'Profile 2'),
            ],
            currentIndex: selectedScreenIndex,
            onTap: (selectedIndex) {
              setState(() {
                _history.remove(selectedScreenIndex);
                _history.add(selectedScreenIndex);
                selectedScreenIndex = selectedIndex;
              });
            },
          ),
        ));
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                  builder: (context) => Offstage(
                    offstage: selectedScreenIndex != index,
                    child: child,
                  ),
                ));
  }
}
