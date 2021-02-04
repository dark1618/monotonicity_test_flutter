import 'package:flutter/material.dart';
import 'dart:math';

class GameWidget extends StatefulWidget {
  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  Random rnd;
  List<String> listAllFigures = [
        "lib/figures/trapAlulEgyBalFentHiany.png",
        "lib/figures/trapAlulGorbLe.png",
        "lib/figures/trapAlulGorbLeBalAlHiany.png",
        "lib/figures/trapBal.png",
        "lib/figures/trapBalEgy.png",
        "lib/figures/trapBalGorbKi.png",
        "lib/figures/trapFent.png",
        "lib/figures/trapJobb.png",
        "lib/figures/trapFentGorbKi.png",
        "lib/figures/trapJobbGorbKi.png",
        "lib/figures/trapLent.png",
        "lib/figures/trapLentBalAlsoHiany.png"
  ];

  List<String> listOfGeneratedFigures = [];
  List<String> listOfPossibleFigures = [];

  void generateFigures() {
    listOfPossibleFigures = []..addAll(listAllFigures); // we load all figures to the possible list
    int _min = 0; // set minimum value for random
    String _figureName;
    int _max;
    rnd = new Random(); // create random
    for(int i = 5; i>0; i--){
      _max = listOfPossibleFigures.length-1; // set max value for random (after each iteration, as list is shrinking)
      int _r = _min + rnd.nextInt(_max-_min); // generate a random number between values
      _figureName = listOfPossibleFigures[_r].toString(); // get filename of generated figure
      listOfGeneratedFigures.add(_figureName); // add generated figure to the list of generated
      listOfPossibleFigures.removeAt(_r);  // remove generated figure from possible figures to avoid duplicates
    }
  }

  String populateFigurePositions() {
    String _figurePath;
    _figurePath = listOfGeneratedFigures[0].toString(); // read first figure path
    listOfGeneratedFigures.removeAt(0); // remove the read figure path to avoid duplicates
    return _figurePath;
  }

  String generateTheMainFigure() { // generate the main figure which is compared
    String _mainFigurePath;
    rnd = new Random();
    int _min = 0;
    int _max = listAllFigures.length-1;
    int _r = _min + rnd.nextInt(_max-_min);
    _mainFigurePath = listAllFigures[_r].toString();
    return _mainFigurePath;
  }


  Widget build(BuildContext context) {
    generateFigures();

    return Scaffold(
      backgroundColor: Colors.deepOrange[200],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10.0), child: Image.asset(populateFigurePositions()),),
                  Padding(padding: EdgeInsets.only(left: 10.0), child: Image.asset(populateFigurePositions()),),
                  Padding(padding: EdgeInsets.only(left: 10.0), child: Image.asset(populateFigurePositions()),),
                  Padding(padding: EdgeInsets.only(left: 10.0), child: Image.asset(populateFigurePositions()),),
                  Padding(padding: EdgeInsets.only(left: 10.0), child: Image.asset(populateFigurePositions()),),
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
                      Image.asset(generateTheMainFigure())
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
                            // figure not found
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
    );
  }
}