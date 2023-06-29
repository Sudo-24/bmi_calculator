import 'package:bmi/reusable_card.dart';

import 'input_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              color: kinactiveCardColour,
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              kactiveCardColour,
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      result,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF24D876),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 90.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      suggestion,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                  ]),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
