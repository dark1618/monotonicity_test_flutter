import 'package:flutter/material.dart';

class StartWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),

                onPressed: () {
                  // On pressed event
                },
                child: Text("Kezdés"),
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}