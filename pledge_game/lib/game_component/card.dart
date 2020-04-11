import 'package:flutter/material.dart';
import 'package:pledgegame/game_component/data.dart';
import 'package:pledgegame/game_component/firework.dart';

class ProfileCardAlignment extends StatelessWidget {
  Pledge pledge;
  String type;

  ProfileCardAlignment(this.pledge) {
    type = pledge.type;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            elevation: 4,
            child: Stack(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(pledge.bg),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        child: ListView(
                          children: <Widget>[
                            orientation == Orientation.portrait ?
                              Padding(padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 6, 0, 0))
                                : Container(),
                            Center(
                              child: Text(
                                pledge.type,
                                style: TextStyle(
                                  fontFamily: 'Sketch',
                                  color: Colors.black,
                                  fontSize: (44.0 * (MediaQuery.of(context).size.width / 366)),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 8.0)),
                            Container(
                              child: Center(
                                child: Text(
                                  pledge.pledge,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22 * (MediaQuery.of(context).size.width / 366),
                                  ),
                                ),
                              ),
                              padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                    (pledge.type == "UNLIMITED" || pledge.type == "INFINITY") ?
                    Fireworks(
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: MediaQuery.of(context).size.height,
                      delay: 1,
                      numberOfExplosions: 5,
                    )
                        : Container(),
                  ],
                ),
              ],
            ),
          );
        },
    );
  }
}
