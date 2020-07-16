import 'package:flutter/material.dart';

import 'loading-button.widget.dart';

class Success extends StatelessWidget {
var result = "";
Function reset;

Success({
  @required this.reset,
  @required this.result
});

  @override
  Widget build(BuildContext context) {
    return   Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  result,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontFamily: "Big Shoulders Display"),
                  textAlign: TextAlign.center,
                ),
                LoadinButton(
                    busy: false,
                    invert: true,
                    func: reset,
                    text: "Calcular novamente"),
              ],
            ),
          );
  }
}