import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pledgegame/game_component/data.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsRuleCard extends StatefulWidget {
  String rule;
  int type;

  SettingsRuleCard({
    @required this.rule,
    @required this.type,
  });

  @override
  _SettingsRuleCard createState() => _SettingsRuleCard(rule: rule,type: type);
}

class _SettingsRuleCard extends State<SettingsRuleCard> {
  String rule;
  int type;

  _SettingsRuleCard({
    @required this.rule,
    @required this.type
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 7,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(Data().ruleBackground[type]),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            rule,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontFamily: GoogleFonts.indieFlower().fontFamily,
            ),
          ),
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    );
  }
}