import 'package:flutter/material.dart';
import 'package:oxir_game/core/customui/more/margin_container.dart';

class LeagueScreen extends StatelessWidget {
  const LeagueScreen({super.key});

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
              Container(
                height: 275,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              GridView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  mainAxisExtent: 275,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(24),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
