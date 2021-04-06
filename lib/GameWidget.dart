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
  bool _gameButtonsEnabled = false;
  Game game = new Game();
  bool mainFound = false;


  @override
  void initState() {
    super.initState();
    game.generateFigures();
    figure1 = game.populateFigurePosition();
    fig1 = Image.asset(figure1);
    listOfGeneratedFigures.add(figure1);
    figure2 = game.populateFigurePosition();
    fig2 = Image.asset(figure2);
    listOfGeneratedFigures.add(figure2);
    figure3 = game.populateFigurePosition();
    fig3 = Image.asset(figure3);
    listOfGeneratedFigures.add(figure3);
    figure4 = game.populateFigurePosition();
    fig4 = Image.asset(figure4);
    listOfGeneratedFigures.add(figure4);
    figure5 = game.populateFigurePosition();
    fig5 = Image.asset(figure5);
    listOfGeneratedFigures.add(figure5);
  }

  void GamePlay() {
    figureMain = game.generateTheMainFigure();
    figMain = Image.asset(figureMain);

    // Check and set if the main figure is one of the generated figures
    if(listOfGeneratedFigures.contains(figureMain)) {
      setState(() {
        mainFound = true;
      });
    }
    else {
      setState(() {
        mainFound = false;
      });
    }
    // Add one to played game counter
    setState(() {
      game.playedGameCounter++;
    });
  }

  foundAction() {
    // If the main figure is one of the generated AND player pressed 'found' button
    // Check if the player decided correctly
    if(mainFound == true)
    {
      // if player selected 'found' and the main was among the generated figures
      setState(() {
        game.correctCounter++;
      });
    }
    else {
      // if player selected 'found' but the main was not one the generated figures
      setState(() {
        game.incorrectCounter++;
      });
    }
    // generate new main figure and update layout
    setState(() {
      GamePlay();
    });
  }

  notFoundAction() {
    // If the main figure is not one of the generated AND player pressed 'Not found' button
    // Check if the player decided correctly
    if(mainFound == false)
    {
      // if player selected 'not found' and the main was not one of the generated figures
      setState(() {
        game.correctCounter++;
      });
    }
    else {
      // if player selected 'not found' and the main was among the generated figures
      setState(() {
        game.incorrectCounter++;
      });
    }
    // generate new main figure and update layout
      setState(() {
      GamePlay();
    });
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

                      // start button event
                      GamePlay();
                      _blurWidgetVisible = false;
                      _gameButtonsEnabled = true;

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
                        figMain,
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
                            onPressed: _gameButtonsEnabled ? ()=> notFoundAction() : null,
                            child: Text("Nincs", style: TextStyle(fontSize: 20),),
                            color: Colors.red[300]
                        ),
                      ),
                      Text('Játék: '+game.playedGameCounter.toString()+'\n'+'Helyes: '+game.correctCounter.toString()+'\n'+'Hibás: '+game.incorrectCounter.toString()),
                      ButtonTheme(
                        height: 90,
                        minWidth: 120,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                            onPressed: _gameButtonsEnabled ? ()=> foundAction() : null,
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