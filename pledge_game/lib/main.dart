import 'package:flutter/material.dart';
import 'package:pledgegame/game_component/data.dart';
import 'package:pledgegame/view/home_page.dart';

void main() => runApp(PledgeGame());

class PledgeGame extends StatelessWidget {
  Data data = Data();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PledgeGame',
      home: HomePage(data),
    );
  }
}