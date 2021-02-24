import 'dart:math';

class Game {
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

  DateTime _start;
  DateTime _stop;


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

  String populateFigurePosition() {
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

  DateTime startTimer(){
    DateTime start = DateTime.now();
    return start;
  }

  DateTime stopTimer(){
    DateTime stop = DateTime.now();
    return stop;
  }

  bool gameInProgress = false;

  Game(){
    gameInProgress = true;
    //generateFigures();
    /*
    do{
      generateFigures();
      startTimer();




    } while(gameInProgress);
    */
  }
}