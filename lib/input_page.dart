import 'dart:math';

import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeColor = Color(0xFF1D1F33);
const bottomColor = Color(0xFFEA1556);
const contentColor = Color(0xFF8E8E99);
const inactiveColor = Color(0xFF101427);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 180;
  int weight = 60;
  int age = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ReCard(
                      onPress: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                      color:
                          gender == Gender.male ? activeColor : inactiveColor,
                      CardContent: cardContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: ReCard(
                        onPress: () {
                          setState(() {
                            gender = Gender.female;
                          });
                        },
                        color: gender == Gender.female
                            ? activeColor
                            : inactiveColor,
                        CardContent: cardContent(
                            icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                      ))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ReCard(
                color: activeColor,
                CardContent: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: TextStyle(color: contentColor, fontSize: 18),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(color: contentColor, fontSize: 18),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 220,
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: ReCard(
                        color: activeColor,
                        CardContent: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style:
                                  TextStyle(color: contentColor, fontSize: 18),
                            ),
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w900),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                    onPress: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.minus,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                    onPress: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.plus,
                                    )),
                              ],
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: ReCard(
                        color: activeColor,
                        CardContent: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style:
                                  TextStyle(color: contentColor, fontSize: 18),
                            ),
                            Text(
                              age.toString(),
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w900),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                    onPress: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.minus,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                    onPress: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.plus,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                BMICalc calc = BMICalc(height: height, weight: weight);
                String bmi = calc.calculateBMI();
                String result= calc.getResult();
                String inter = calc.getInterpretation();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              result: result,
                              bmi: bmi,
                              interpretation: inter,
                            )));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE YOUR BMI',
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
        ));
  }
}

class cardContent extends StatelessWidget {
  cardContent({@required this.icon, @required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStyle(color: contentColor, fontSize: 18),
        )
      ],
    );
  }
}

class ReCard extends StatelessWidget {
  ReCard({@required this.color, this.CardContent, this.onPress});

  final Color color;
  final Widget CardContent;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: CardContent,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPress});

  final Icon icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 1.0,
      child: icon,
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

class BMICalc {
  BMICalc({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
