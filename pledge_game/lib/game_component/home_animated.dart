import 'package:flutter/material.dart';

class HomeAnimation extends StatefulWidget {
  Color color;
  String text;
  List<Color> colorGrid;
  Widget child;

  HomeAnimation({
    @required this.color,
    @required this.text,
    @required this.colorGrid,
    @required this.child
  });

  @override
  _HomeAnimation createState() => _HomeAnimation(name: text, color: color, colorGrid: colorGrid, child: child);
}

class _HomeAnimation extends State<HomeAnimation> with SingleTickerProviderStateMixin {
  String name;
  Color color;
  List<Color> colorGrid;
  BoxDecoration decoFirst;
  BoxDecoration decoSecond;
  BoxDecoration deco;
  Widget child;

  _HomeAnimation({
    @required this.color,
    @required this.name,
    @required this.colorGrid,
    @required this.child
  }) {
    decoFirst = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: colorGrid,
      ),
    );
    decoSecond = BoxDecoration(
      color: color,
    );
    deco = decoFirst;
  }

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
    return GestureDetector(
      onLongPress: () {
        setState(() {
          deco = decoSecond;
        });
      },
      onLongPressEnd: (LongPressEndDetails details) {
        setState(() {
          deco = decoFirst;
          Navigator.push(context, MaterialPageRoute(builder: (context) => child));
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        child: Material(
          child: InkWell(
            onTap: () {
              setState(() {
                deco = decoSecond;
                Navigator.push(context, MaterialPageRoute(builder: (context) => child));
              });
            },
            child: Container(
              decoration: deco,
              child: Center(
                child: Text(
                  name == null ? 'Error' : name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 58 * (MediaQuery.of(context).size.width / 360),
                    fontFamily: 'KidsPlay',
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 15.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}