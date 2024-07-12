import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 26,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 60,
          color: const Color(0xff272a2f),
          child: Row(
            children: [
              navItem(
                'Dashboard',
                'exirplus',
                pageIndex == 0,
                onTap: () => onTap(0),
              ),
              navItem(
                'sports',
                'main',
                pageIndex == 1,
                onTap: () => onTap(1),
              ),
              navItem(
                'Friends',
                'friends',
                pageIndex == 2,
                onTap: () => onTap(2),
              ),
              navItem(
                'Results',
                'earn',
                pageIndex == 3,
                onTap: () => onTap(3),
              ),
              navItem(
                'Airdrop',
                'airdrop',
                pageIndex == 4,
                onTap: () => onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(
    String title,
    String nameIcon,
    bool selected, {
    Function()? onTap,
  }) {
    return Expanded(
      child: InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color:
                  selected ? const Color(0xff1c1f24) : const Color(0xff272a2f),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/$nameIcon.png',
                  height: 25,
                  width: 25,
                  color: selected &&
                          nameIcon != 'exirplus' &&
                          nameIcon != 'airdrop'
                      ? Colors.white
                      : selected == false &&
                              nameIcon != 'exirplus' &&
                              nameIcon != 'airdrop'
                          ? const Color(0xff4e4f51)
                          : null,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: selected ? Colors.white : const Color(0xff8b8e93),
                    fontSize: 10,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
