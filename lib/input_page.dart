import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'package:powers/powers.dart';

enum Gender { Male, Female }

double bmi = 19.0;
var result = 'NORMAL';
var suggestion = 'Do Exercise';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.Male;
  int height = 150;
  int weight = 56;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //updateColour(Gender.Male);
                        selectedGender = Gender.Male;
                      });
                    },
                    child: ReusableCard(
                      selectedGender == Gender.Male
                          ? kactiveCardColour
                          : kinactiveCardColour,
                      IconContent(
                        FontAwesomeIcons.mars,
                        'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //updateColour(Gender.Female);
                        selectedGender = Gender.Female;
                      });
                    },
                    child: ReusableCard(
                      selectedGender == Gender.Female
                          ? kactiveCardColour
                          : kinactiveCardColour,
                      IconContent(
                        FontAwesomeIcons.venus,
                        'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            kactiveCardColour,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberStyle,
                    ),
                    Text(
                      'cm',
                      style: klabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    overlayColor: Color(0x29EB1555),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    inactiveTrackColor: Color(0xFF8D8E98),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: kMinHeight,
                      max: kMaxHEight,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      }),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    kactiveCardColour,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    kactiveCardColour,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // Expanded(child: NewWeb(color: kactiveCardColour)),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage()));
              bmi = weight / ((height / 100).squared());
              if (bmi < 18.5) {
                result = 'UNDERWEIGHT';
                suggestion =
                    'You have lower than normal body weight need to build muscle';
              } else if (bmi >= 18.5 && bmi < 25.0) {
                result = 'NORMALWEIGHT';
                suggestion =
                    'You are fit as fuck keep doing exercise and eat protien';
              } else {
                result = 'OVERWEIGHT';
                suggestion =
                    'You have higher than normal body weight need to exercise';
              }
            },
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: KButtonStyle,
          ),
        ),
        margin: const EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        height: kbottomContainerHeight,
        width: double.infinity,
        color: const Color(0xFFFF0067),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: () {
        onPressed();
      },
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
