import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:pledgegame/game_component/card.dart';
import 'package:pledgegame/game_component/data.dart';

List<Alignment> cardsAlign = [
  Alignment(0.0, 1.0),
  Alignment(0.0, 0.8),
  Alignment(0.0, 0.0)
];
List<Size> cardsSize = List(3);
Data _data;

class GameCard extends StatefulWidget {
  GameCard(BuildContext context, Data data) {
    cardsSize[0] = Size(MediaQuery.of(context).size.width * 0.9,
        MediaQuery.of(context).size.height * 0.84);
    cardsSize[1] = Size(MediaQuery.of(context).size.width * 0.85,
        MediaQuery.of(context).size.height * 0.69);
    cardsSize[2] = Size(MediaQuery.of(context).size.width * 0.8,
        MediaQuery.of(context).size.height * 0.62);
    _data = data;
  }

  @override
  _GameCard createState() => _GameCard();
}

class _GameCard extends State<GameCard> with SingleTickerProviderStateMixin {
  int cardsCounter = 0;
  List<ProfileCardAlignment> cards = List();
  AnimationController _ctrl;
  final Alignment defaultFrontCardAlign = Alignment(0.0, 0.0);
  Alignment frontCardAlign;
  double frontCardRot = 0.0;

  @override
  void initState() {
    super.initState();
    for (cardsCounter = 0; cardsCounter < 3; cardsCounter++) {
      cards.add(ProfileCardAlignment(getPledge()));
    }
    frontCardAlign = cardsAlign[2];
    _ctrl =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    _ctrl.addListener(() => setState(() {}));
    _ctrl.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) changeCardsOrder();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          backCard(),
          middleCard(),
          frontCard(),
          _ctrl.status != AnimationStatus.forward
              ? SizedBox.expand(
                  child: GestureDetector(
                  onPanUpdate: (DragUpdateDetails details) {
                    setState(() {
                      frontCardAlign = Alignment(
                          frontCardAlign.x +
                              20 *
                                  details.delta.dx /
                                  MediaQuery.of(context).size.width,
                          frontCardAlign.y +
                              25 *
                                  details.delta.dy /
                                  MediaQuery.of(context).size.height);

                      frontCardRot = frontCardAlign.x;
                    });
                  },
                  onPanEnd: (_) {
                    if (frontCardAlign.x > 3.0 || frontCardAlign.x < -3.0) {
                      animateCard();
                    } else {
                      setState(() {
                        frontCardAlign = defaultFrontCardAlign;
                        frontCardRot = 0.0;
                      });
                    }
                  },
                ))
              : Container(),
        ],
      ),
    );
  }

  void changeCardsOrder() {
    setState(() {
      var temp = cards[0];
      cards[0] = cards[1];
      cards[1] = cards[2];
      cards[2] = temp;

      cards[2] = ProfileCardAlignment(getPledge());
      cardsCounter++;

      frontCardAlign = defaultFrontCardAlign;
      frontCardRot = 0.0;
    });
  }

  Widget backCard() {
    return Align(
      alignment: _ctrl.status == AnimationStatus.forward
          ? CardsAnimation.backCardAlignmentAnim(_ctrl).value
          : cardsAlign[0],
      child: SizedBox.fromSize(
          size: _ctrl.status == AnimationStatus.forward
              ? CardsAnimation.backCardSizeAnim(_ctrl).value
              : cardsSize[2],
          child: cards[2]),
    );
  }

  Widget middleCard() {
    return Align(
      alignment: _ctrl.status == AnimationStatus.forward
          ? CardsAnimation.middleCardAlignmentAnim(_ctrl).value
          : cardsAlign[1],
      child: SizedBox.fromSize(
          size: _ctrl.status == AnimationStatus.forward
              ? CardsAnimation.middleCardSizeAnim(_ctrl).value
              : cardsSize[1],
          child: cards[1]),
    );
  }

  Widget frontCard() {
    return Align(
        alignment: _ctrl.status == AnimationStatus.forward
            ? CardsAnimation.frontCardDisappearAlignmentAnim(
                    _ctrl, frontCardAlign)
                .value
            : frontCardAlign,
        child: Transform.rotate(
          angle: (math.pi / 180.0) * frontCardRot,
          child: SizedBox.fromSize(size: cardsSize[0], child: cards[0]),
        ));
  }

  void animateCard() {
    _ctrl.stop();
    _ctrl.value = 0.0;
    _ctrl.forward();
  }

  Pledge getPledge() {
    int pos = math.Random().hashCode % _data.pledge.length;
    Pledge tmp = _data.pledge[pos];

    _data.pledge.removeAt(pos);
    if (_data.pledge.length <= 3)
      _data = Data();
    return tmp;
  }
}

class CardsAnimation {
  static Animation<Alignment> backCardAlignmentAnim(
      AnimationController parent) {
    return AlignmentTween(begin: cardsAlign[0], end: cardsAlign[1]).animate(
        CurvedAnimation(
            parent: parent, curve: Interval(0.4, 0.7, curve: Curves.easeIn)));
  }

  static Animation<Size> backCardSizeAnim(AnimationController parent) {
    return SizeTween(begin: cardsSize[2], end: cardsSize[1]).animate(
        CurvedAnimation(
            parent: parent, curve: Interval(0.4, 0.7, curve: Curves.easeIn)));
  }

  static Animation<Alignment> middleCardAlignmentAnim(
      AnimationController parent) {
    return AlignmentTween(begin: cardsAlign[1], end: cardsAlign[2]).animate(
        CurvedAnimation(
            parent: parent, curve: Interval(0.2, 0.5, curve: Curves.easeIn)));
  }

  static Animation<Size> middleCardSizeAnim(AnimationController parent) {
    return SizeTween(begin: cardsSize[1], end: cardsSize[0]).animate(
        CurvedAnimation(
            parent: parent, curve: Interval(0.2, 0.5, curve: Curves.easeIn)));
  }

  static Animation<Alignment> frontCardDisappearAlignmentAnim(
      AnimationController parent, Alignment beginAlign) {
    return AlignmentTween(
            begin: beginAlign,
            end: Alignment(
                beginAlign.x > 0 ? beginAlign.x + 30.0 : beginAlign.x - 30.0,
                0.0) // Has swiped to the left or right?
            )
        .animate(CurvedAnimation(
            parent: parent, curve: Interval(0.0, 0.5, curve: Curves.easeIn)));
  }
}
