import 'package:flutter/material.dart';
import 'package:pledgegame/game_component/game_card.dart';
import 'package:pledgegame/game_component/data.dart';

Data _data;

class GamePage extends StatefulWidget {
  GamePage(Data tmp) {
    _data = tmp;
  }

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg3.jpg"),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          children: <Widget>[
            GameCard(context, _data),
            Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ),
    );
  }
}
