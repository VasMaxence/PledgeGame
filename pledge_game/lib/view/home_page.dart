import 'package:flutter/material.dart';
import 'package:pledgegame/game_component/data.dart';
import 'package:pledgegame/game_component/game_card.dart';
import 'package:pledgegame/game_component/home_animated.dart';
import 'package:pledgegame/view/game_page.dart';
import 'package:pledgegame/view/settings_page.dart';

Data _data;

class HomePage extends StatefulWidget {
  HomePage(Data tmp) {
    _data = tmp;
  }

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  AnimationController _ctrl;
  CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();
    _ctrl =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _curve = CurvedAnimation(parent: _ctrl, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            HomeAnimation(
              color: Colors.red,
              text: "JOUER",
              colorGrid: [
                Colors.red.shade900,
                Colors.red.shade600,
                Colors.red.shade700,
              ],
              child: Container(
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
            ),
            HomeAnimation(
              color: Colors.blue,
              text: "REGLE ET GAGE",
              colorGrid: [
                Colors.blue.shade900,
                Colors.blue.shade600,
                Colors.blue.shade700,
              ],
              child: SettingsPage(),
            ),
          ],
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Image.asset("assets/logo.png"),
          ),
        ),
      ],
    );
  }
}
