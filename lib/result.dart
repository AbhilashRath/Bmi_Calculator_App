import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

const activeColor = Color(0xFF1D1F33);
const bottomColor = Color(0xFFEA1556);
const contentColor = Color(0xFF8E8E99);
const inactiveColor = Color(0xFF101427);

class ResultPage extends StatelessWidget {
  ResultPage({@required this.result,@required this.bmi,@required this.interpretation});
  final String result;
  final String bmi;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReCard(
              color: activeColor,
              CardContent: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(result.toUpperCase(),style: TextStyle(
                    color: Color(0xFF24D876),
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(bmi,style: TextStyle(
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text(interpretation,textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 22,
                  ),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              color: bottomColor,
              width: double.infinity,
              height: 65,
              margin: EdgeInsets.only(top: 10),
            ),
          )
        ],
      ),
    );
  }
}
