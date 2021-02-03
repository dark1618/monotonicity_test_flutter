import 'package:flutter/material.dart';

class StartWidget extends StatefulWidget {
  @override
  _StartWidgetState createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  int _repeat = 500; // repeat count

  void _incrementRepeat() {
    setState(() {
      _repeat = _repeat+50; // increase repeat count
    });
  }
  void _decrementRepeat() {
    setState(() {
      if(_repeat > 0)
      _repeat = _repeat-50; // decrease repeat count but don't go below zero
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Monotonitástűrés-teszt"),
      ),
      body: SafeArea(
        child:Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Ismétlés:", style: TextStyle(fontSize: 20),),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child:FloatingActionButton(
                            onPressed: _decrementRepeat,
                            child: new Icon(Icons.remove),
                        ),),
                        Text("$_repeat", style: TextStyle(fontSize: 20),),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: FloatingActionButton(
                            onPressed: _incrementRepeat,
                            child: new Icon(Icons.add),
                          ),
                        )

                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: ButtonTheme(
                      minWidth: 200,
                      height: 100,
                      child:
                          RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                            onPressed: () {
                              // On pressed event
                            },
                            child: Text("Kezdés",style: TextStyle(fontSize: 20)),
                            color: Colors.blue,
                            splashColor: Colors.redAccent,
                          ),
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}