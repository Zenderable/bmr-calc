import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:check_your_bmr_and_bmi/constants.dart';
import 'package:check_your_bmr_and_bmi/components/background_card.dart';
import 'package:check_your_bmr_and_bmi/components/icon_content.dart';

enum GenderType {
  male,
  female,
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GenderType selectedGender;
  int height = 160;
  int weight = 75;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Center(child: Text('Check Your BMR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BackgroundCard(
                    color: kActiveCardColor,
                    childContainer: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              weight.toString(),
                              style: kNumberStyle,
                            ),
                            Text(
                              'kg',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                                color: Color(0xFF4CAF50),
                                icon: FontAwesomeIcons.minus,
                                action: () {
                                  setState(() {
                                    weight--;
                                    if (weight <= 0) {
                                      weight = 0;
                                    }
                                  });
                                }),
                            SizedBox(
                              width: 8.0,
                            ),
                            RoundedIconButton(
                                color: Color(0xFF0288D1),
                                icon: FontAwesomeIcons.plus,
                                action: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BackgroundCard(
                    color: kActiveCardColor,
                    childContainer: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                                color: Color(0xFF4CAF50),
                                icon: FontAwesomeIcons.minus,
                                action: () {
                                  setState(() {
                                    age--;
                                    if (age <= 0) {
                                      age = 0;
                                    }
                                  });
                                }),
                            SizedBox(
                              width: 8.0,
                            ),
                            RoundedIconButton(
                                color: Color(0xFF0288D1),
                                icon: FontAwesomeIcons.plus,
                                action: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: BackgroundCard(
              color: kActiveCardColor,
              childContainer: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFF01DC24),
                      thumbColor: Color(0xFF00D1FF),
                      overlayColor: Color(0x2900D1FF),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 80.0,
                      max: 240.0,
                      inactiveColor: Color(0xFF8D8E98),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BackgroundCard(
                    color: selectedGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childContainer: IconContent(
                      color: Color(0xFF18C0F4),
                      sex: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    gesture: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: BackgroundCard(
                    color: selectedGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childContainer: IconContent(
                      color: Color(0xFFF1008F),
                      sex: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    gesture: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: null,
              child: Container(
                width: double.infinity,
                child: BackgroundCard(
                  color: kBottomButtonColor,
                  childContainer: Center(
                    child: Text('Calculate'),
                  ),
                ),
              ),
            ),
          )
//          BottomButton(
//            text: 'CALCULATE',
//            onTap: () {
//              Calculator calc = Calculator(height: height, weight: weight);
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => ResultsPage(
//                    bmiResult: calc.calculateBMI(),
//                    resultText: calc.getResult(),
//                    interpretation: calc.getInterpretation(),
//                  ),
//                ),
//              );
//            },
//          ),
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({this.icon, this.action, this.color});
  final IconData icon;
  final Function action;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: action,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: color,
    );
  }
}
