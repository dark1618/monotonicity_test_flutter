import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:monotonicitytest/Game.dart';

class GameWidget extends StatefulWidget {
  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {

  List<String> listOfGeneratedFigures = [];
  List<String> listOfPossibleFigures = [];
  String figure1;
  String figure2;
  String figure3;
  String figure4;
  String figure5;
  String figureMain;
  Image fig1 = Image.asset("lib/figures/trapJobb.png");
  Image fig2 = Image.asset("lib/figures/trapJobb.png");
  Image fig3 = Image.asset("lib/figures/trapJobb.png");
  Image fig4 = Image.asset("lib/figures/trapJobb.png");
  Image fig5 = Image.asset("lib/figures/trapJobb.png");
  Image figMain = Image.asset("lib/figures/trapJobb.png");
  bool _blurWidgetVisible = true;

  @override
  void initState() {
    super.initState();
    //GamePlay();
  }

  void GamePlay() {
    Game game = new Game();
    game.generateFigures();
    listOfGeneratedFigures = game.listOfGeneratedFigures;
    figure1 = game.populateFigurePosition();
    fig1 = Image.asset(figure1);
    figure2 = game.populateFigurePosition();
    fig2 = Image.asset(figure2);
    figure3 = game.populateFigurePosition();
    fig3 = Image.asset(figure3);
    figure4 = game.populateFigurePosition();
    fig4 = Image.asset(figure4);
    figure5 = game.populateFigurePosition();
    fig5 = Image.asset(figure5);
    figureMain = game.generateTheMainFigure();
    figMain = Image.asset(figureMain);
  }

  Widget _StartButtonWithBlur()
  {
    return Visibility(
        visible: _blurWidgetVisible,
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Dialog(
              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              backgroundColor: Colors.transparent,
              child: Container(
                width: 100.0,
                height: 100.0,
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.black,
                  onPressed: () {
                    setState(() {
                      _blurWidgetVisible = false;
                      GamePlay();
                    });
                  },
                  child: Text("Kezdés", style: TextStyle(fontSize: 18)),
                )
              )
            )
        )
    );
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
        backgroundColor: Colors.deepOrange[200],
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 10.0), child: fig1,),
                      Padding(padding: EdgeInsets.only(left: 10.0), child: fig2,),
                      Padding(padding: EdgeInsets.only(left: 10.0), child: fig3,),
                      Padding(padding: EdgeInsets.only(left: 10.0), child: fig4,),
                      Padding(padding: EdgeInsets.only(left: 10.0), child: fig5,),
                      // dynamic content
                    ],
                  ),
                ),
                Expanded(
                  flex: 13,
                  child:
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Image.asset(figureMain)
                        figMain
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ButtonTheme(
                        height: 90,
                        minWidth: 120,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                            onPressed: () {
                              // figure cannot be found
                              setState(() {
                                GamePlay();
                              });
                            },
                            child: Text("Nincs", style: TextStyle(fontSize: 20),),
                            color: Colors.red[300]
                        ),
                      ),
                      ButtonTheme(
                        height: 90,
                        minWidth: 120,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                            onPressed: () {
                              // figure can be found
                              setState(() {
                                GamePlay();
                              });
                            },
                            child: Text("Van", style: TextStyle(fontSize: 20),),
                            color: Colors.green[300]
                        ),
                      ),
                    ],
                  ),),
              ],
            ),
          ),
        ),
        _StartButtonWithBlur(),
      ],
    );
  }
}