import 'package:flutter/material.dart';
import 'package:pledgegame/game_component/settings_rule.dart';

class SettingsPage extends StatelessWidget {
  List<SettingsRuleCard> _rule;
  ScrollController _scrollController = ScrollController();

  SettingsPage() {
    _rule = listRule();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 5,
                padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                child: Image.asset("assets/logo.png"),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: ListView(
                    children: _rule,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<SettingsRuleCard> listRule() {
    List<SettingsRuleCard> ret = [];

    ret.add(SettingsRuleCard(
        rule: "Tu connais plus les prénoms?\nEt ba hop, 1 gage", type: 1));
    ret.add(SettingsRuleCard(
        rule: "Déja que tu joue à ce jeu, en plus tu perds au jeu?\nAller prends 1 gage...", type: 2));
    ret.add(SettingsRuleCard(rule: "T'es à la bourd à la soirée!\nTu vas devoir la commencer avec 1 gage!", type: 3));
    ret.add(SettingsRuleCard(rule: "Attend tu perds et tu refuse ton gage?? Tu t'es cru chez ta mère?\nPrends 1 gage de plus pour la peine :D", type: 2));
    ret.add(SettingsRuleCard(rule: "Si Dieu le décide tu dois obéir, 1 gage pour toi.", type: 1));
    ret.add(SettingsRuleCard(rule: "Une alliance contre toi? Non vraiment tu risque rien.\n Attend 30% des joueurs sont contre toi?\n et ba 1 gage alors...", type: 3));
    ret.add(SettingsRuleCard(rule: "Tu refuse un gage? vraiment?\nEt ba prends en 2 alors!", type: 1));
    ret.add(SettingsRuleCard(rule: "Ce gage est trop violent pour toi?\nTu peux demander grâce auprès de dieu", type: 4));
    ret.add(SettingsRuleCard(rule: "Tu es courageux(se) et tu voudrais filer ton gage à quelqu'un?\nDéfi le, si tu gagne, il le prend.\nMais si tu perds, tu en prends 1 de plus", type: 2));
    return ret;
  }
}
