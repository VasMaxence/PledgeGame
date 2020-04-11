import 'dart:math';

import 'package:flutter/material.dart';

class Data {
  static final List<String> _easyPledge = [
    "Karaoké TIME!\n(Tchikita)",
    "Karaoké TIME!\n(Pookie)",
    "Karaoké TIME!\n(La Lepre de Zerator)",
    "Karaoké TIME!\n(Moulaga)",
    "Karaoké TIME!\n(Belle, tu peux choisir 3 personnes pour t'accompagner)",
    "À la flotte...\nTu dois sauter dans la piscine",
    "Tu dois complimenter, avec des mots sincères, toutes les personnes de la soirée",
    "Mamoud vendeur de tapis!\nTu dois essayer de vendre un stylo à une personne de ton choix",
    "Faire une déclaration machiste à la personne de ton choix",
    "L’hôte est obligé de faire un discours pour ses invités",
    "Les minis-hôtes doivent faire un discours avec l’hôte pour les invités",
    "Cupidon\nDésigne deux personnes qui doivent agir comme si elles étaient en couple pendant 20 minutes",
    "Chanteur né\nQuand tu veux parler, tu devras chanter pendant les 10 prochaines minutes",
    "Tu dois mettre tes chaussettes sur tes branches de lunettes",
    "Tu dois faire la conversation à ta chaise pendant 2 minutes",
    "Mamoud!\nTu dois parler avec un accent mamadou pendant 5 minutes",
    "Vas-y frère!\nTu dois draguer un des autres joueurs",
    "Coup de chance\nChoisis l'un des hôtes et épile le",
    "Picasso!\nTu dois te laisser dessiner sur le corps par une personne désigné par les autres joueurs",
    "Tu dois citer les 7 péchés capitaux, les septs merveilles du mondes et les couleurs de l’arc en ciel, sinon c’est deux gages de plus BB",
    "Coup de chance!\nLes hôtes prennent deux gages",
    "Coup de chance!\nL'hôte désigne une personne qui prend 1 gage",
    "Coup de chance!\nL'hôte désigne une personne qui prend 1 gage",
    "Coup de chance!\nL'hôte désigne une personne qui prend 1 gage",
  ];
  static final List<String> _mediumPledge = [
    "Just Dance Time!\n Choisis quelqu'un pour t'accompagner",
    "Just Dance Time!\n Défi quelqu'un en 1 VS 1",
    "À la flotte... Tu dois sauter habiller dans la piscine ;D",
    "Improvise toi BarMan / BarMaid et fais un coktail pour toutes les personnes qui ont soif",
    "Barack Obama ? C'est toi ? Improvise un discours sur le sport de chambre...",
    "Fais une déclaration machiste à une personne désigné par les autres joueurs",
    "Tu choisis deux personnes qui doivent s’embrasser ou se faire un gros calins",
    "Essaye de vendre, avec un ami, le premier objet que tu vois à la personne que tu veux",
    "Attacher deux personnes ensembles (par un membre :D) pendant 5 minutes",
    "Hey Macarena!\n Tu dois danser la Macaréna avec une personne de ton choix",
    "Cupidon\nFais une déclaration d'amour à la personne désigné par les autres joueurs",
    "Je suis non binaire\nTu dois agir comme une personne du sexe opposés durant les 5 prochaines minutes",
    "Beer Pong Time!\n Tu dois défier l'équipe des hôtes (si tu perds c'est 1 autre gage, pour ton equipier aussi)",
    "Tu dois te faire maquiller par les personnes du sexe opposés",
    "Haleine de Dragon!\nTu dois manger un piment brut",
    "Picasso!\nLaisse les autres joueurs te faire un dessin sur le corps (où ils veulent)"
  ];
  static final List<String> _hardPledge = [
    "Petit Chanceux ;)\nTu dois draguer l'un des hôtes, tu peux défier quelqu'un pour lui refiler ton gage)",
    "Girl Power\nTu devras obéir aux ordres des femmes",
    "Es-tu pur ?\nTu dois faire un test de pureté et expliquer tes choix lorsqu’on te le demande",
    "Es-tu pur ?\nTu dois faire un test de pureté et expliquer tes choix lorsqu’on te le demande",
    "Es-tu pur ?\nTu dois faire un test de pureté et expliquer tes choix lorsqu’on te le demande",
    "À la flotte!\nToi et deux personnes de ton choix doivent plonger dans la piscine (de la facon que tu choisis)",
    "L’hôte désigne quelqu’un qui est cupidon, il doit te choisir toi et quelqu’un pour former un couple pendant 10 minutes",
    "Cupidon\nLa personne la plus jeune choisis deux personnes qui doivent former un couple pendant 20 minutes",
    "Tu dois te faire maquiller par une personne du sexe opposés (choisi par les dieux)",
    "C'est la honte!\nTu dois te faire prendre en photo dans une position défini par les autres joueurs",
    "Danseur inné\nTu dois faire une danse de poll dance pendant devant tous les autres joueurs",
    "Courage!\nTu dois goûter le Cocktail du Chef",
    "Courage!\nTu dois goûter le Cocktail du Chef",
    "Courage!\nTu dois goûter le Cocktail du Chef",
    "Tu dois te faire épiler un membre, n'importe quel membre",
    "COURAGE, Tu dois deviner qui à prononcer : \"les pyramides de Galilée\", si tu as juste, cette personne prend 1 gage",
  ];
  static final List<String> _unlimitedPledge = [
    "Paix à toi!\nTu dois embrasser la dernière personne à avoir eu un gage à l'endroit décidé par les autres joueurs",
    "Tu dois deviner les personnes qui seront devant toi en ayant les yeux bandés",
    "Tu dois deviner les personnes qui seront devant toi en ayant les yeux bandés",
    "Tu dois deviner les personnes qui seront devant toi en ayant les yeux bandés",
    "Usain Bolt!\nTu dois courir en caleçon dehors",
    "Eskimos!\nMets ton soutiens gorge ou caleçon pendant 1 heure au congelateur avant de le remettre",
    "Picasso!\nTu dois te faire maquiller par l'hôte ;D",
  ];
  static final List<String> _infinityPledge = [
    "Coronavirus ou Gage ?\nTu dois courir à OILP dehors, tu peu-x choisir quelqu'un pour t'accompagner :D",
    "Coronavirus ou Gage ?\nTu dois faire un Strip Tease devant les autres joueurs ;D",
  ];
  static final List<String> _bgCard = [
    "assets/blue-background-game.png",
    "assets/yellow-background-game.png",
    "assets/red-background-game.png",
    "assets/green-background-game.png",
    "assets/purple-background-game.png",
  ];
  List<String> ruleBackground = [
    "assets/blue-background-game.png",
    "assets/yellow-background-game.png",
    "assets/red-background-game.png",
    "assets/green-background-game.png",
    "assets/purple-background-game.png",
  ];
  List<Pledge> pledge = [];

  Data() {
    for (int i = 0; i < _easyPledge.length; i++)
      pledge.add(Pledge(type: "EASY", pledge: _easyPledge[i], bg: _bgCard[Random().hashCode % _bgCard.length]));
    for (int i = 0; i < _mediumPledge.length; i++)
      pledge.add(Pledge(type: "MEDIUM", pledge: _mediumPledge[i], bg: _bgCard[Random().hashCode % _bgCard.length]));
    for (int i = 0; i < _hardPledge.length; i++)
      pledge.add(Pledge(type: "HARD", pledge: _hardPledge[i], bg: _bgCard[Random().hashCode % _bgCard.length]));
    for (int i = 0; i < _unlimitedPledge.length; i++)
      pledge.add(Pledge(type: "UNLIMITED", pledge: _unlimitedPledge[i], bg: _bgCard[Random().hashCode % _bgCard.length]));
    for (int i = 0; i < _infinityPledge.length; i++)
      pledge.add(Pledge(type: "INFINITY", pledge: _infinityPledge[i], bg: _bgCard[Random().hashCode % _bgCard.length]));
  }
}

class Pledge {
  final String type;
  final String pledge;
  final String bg;

  Pledge({
    @required this.type,
    @required this.pledge,
    @required this.bg,
  });
}
