import 'package:flutter/material.dart';
import 'package:oxir_game/core/customui/more/margin_container.dart';
import 'package:oxir_game/core/customui/more/spacing_widgets.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: HorizontalMarginContainer(
          margin: 16,
          child: Column(
            children: [
              const VerticalSpace(16),
              const Text(
                'Invite friends!',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const VerticalSpace(8),
              const Text(
                'You and your friend will receive bonuses',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const VerticalSpace(24),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xff272a2f),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset('assets/icons/love.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Invite a friend',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const VerticalSpace(8),
                        Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Colors.amber,
                              size: 8,
                            ),
                            const HorizontalSpace(4),
                            Image.asset(
                              'assets/icons/coin.png',
                              height: 24,
                            ),
                            const HorizontalSpace(8),
                            const Text(
                              '+5,000',
                              style: TextStyle(
                                color: Colors.amber,
                              ),
                            ),
                            const HorizontalSpace(4),
                            const Text(
                              'for you and your friend',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const VerticalSpace(48),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'List of your friends (2)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.refresh_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
              const VerticalSpace(8),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xff272a2f),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                        ),
                        const HorizontalSpace(8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'user 1',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  color: Colors.amber,
                                  size: 8,
                                ),
                                const HorizontalSpace(4),
                                Image.asset(
                                  'assets/icons/coin.png',
                                  height: 16,
                                ),
                                const HorizontalSpace(4),
                                const Text(
                                  '15.36k',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                const HorizontalSpace(4),
                                const Text(
                                  '(49.39M)',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/icons/coin.png',
                          height: 24,
                        ),
                        const HorizontalSpace(4),
                        const Text(
                          '25k',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Invite a friend',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          HorizontalSpace(4),
                          Icon(
                            Icons.add_reaction_sharp,
                            color: Colors.white,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const HorizontalSpace(4),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.copy,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const VerticalSpace(100),
            ],
          ),
        ),
      ),
    );
  }
}
