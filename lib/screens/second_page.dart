import 'package:flutter/material.dart';
import 'package:check_your_bmr_and_bmi/constants.dart';
import 'package:check_your_bmr_and_bmi/components/background_card.dart';
import 'package:check_your_bmr_and_bmi/components/buttons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

enum ActivityLevel {
  level_0,
  level_1,
  level_2,
  level_3,
  level_4,
}

enum WeightGoal {
  lose,
  gain,
  keep,
}

class SecondPage extends StatefulWidget {
  final String bmrResult;
  final String bmiResult;
  final String resultText;
  final String interpretation;
  SecondPage(
      {this.resultText, this.interpretation, this.bmiResult, this.bmrResult});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  ActivityLevel selectedLevel = ActivityLevel.level_0;
  WeightGoal selectedGoal = WeightGoal.keep;
  double endBMR;
  double finalBMR() {
    endBMR = 0;
    if (selectedLevel == ActivityLevel.level_0) {
      endBMR = 1.2 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else if (selectedLevel == ActivityLevel.level_1) {
      endBMR = 1.35 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else if (selectedLevel == ActivityLevel.level_2) {
      endBMR = 1.55 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else if (selectedLevel == ActivityLevel.level_3) {
      endBMR = 1.75 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else if (selectedLevel == ActivityLevel.level_4) {
      endBMR = 2.05 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else
      return endBMR;
  }

  double returnedBMR;

  @override
  void initState() {
    super.initState();
    returnedBMR = finalBMR();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Center(
          child: Text(
            'BMR Calc',
            style: TextStyle(
              fontFamily: "Jaapokki",
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
                child: Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Row(
                children: <Widget>[
                  Text('Your BMI: ${widget.bmiResult}',
                      style: kResultsTitleTextStyle),
                  Flexible(
                    child: BackgroundCard(
                      color: (widget.resultText == 'Underweight' ||
                              widget.resultText == 'Overweight')
                          ? Color(0xFFFEEAEA)
                          : Color(0xFFE3FFEE),
                      childContainer: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            widget.resultText.toUpperCase(),
                            style: kResultsTextStyle.copyWith(
                              color: (widget.resultText == 'Underweight' ||
                                      widget.resultText == 'Overweight')
                                  ? Color(0xFFF95F49)
                                  : Color(0xFF48C67D),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    bottom: 100.0,
                                    top: 20.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEDE4FE),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '< 18,5 – underweight',
                                          style: kInfoTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '18,5 – 24,99 – normal',
                                          style: kInfoTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '≥ 25,0 – overweight',
                                          style: kInfoTextStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    )),
                              );
                            });
                      },
                      icon: Icon(
                        FontAwesomeIcons.infoCircle,
                        color: Colors.black,
                      )),
                ],
              ),
            )),
          ),
          Expanded(
            flex: 1,
            child: BackgroundCard(
              radius: 10.0,
              color: Color(0xFFEDE4FE),
              childContainer: Container(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          widget.interpretation,
                          style: kBodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text('Your activity level:',
                    style:
                        kResultsTitleTextStyle.copyWith(color: Colors.black87)),
              )),
          Expanded(
            flex: 2,
            child: ListView(
              children: <Widget>[
                BackgroundCard(
                  gesture: () {
                    setState(() {
                      selectedLevel = ActivityLevel.level_0;
                      returnedBMR = finalBMR();
                    });
                  },
                  color: selectedLevel == ActivityLevel.level_0
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  childContainer: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'No activity',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ),
                          Text(
                            '(sedentary work)',
                            textAlign: TextAlign.center,
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BackgroundCard(
                  gesture: () {
                    setState(() {
                      selectedLevel = ActivityLevel.level_1;
                      returnedBMR = finalBMR();
                    });
                  },
                  color: selectedLevel == ActivityLevel.level_1
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  childContainer: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Low activity',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ),
                          Text(
                            '(1-2 workouts per week)',
                            textAlign: TextAlign.center,
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BackgroundCard(
                  gesture: () {
                    setState(() {
                      selectedLevel = ActivityLevel.level_2;
                      returnedBMR = finalBMR();
                    });
                  },
                  color: selectedLevel == ActivityLevel.level_2
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  childContainer: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Average activity',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              '(3-4 workouts per week,',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'sedentary work)',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BackgroundCard(
                  gesture: () {
                    setState(() {
                      selectedLevel = ActivityLevel.level_3;
                      returnedBMR = finalBMR();
                    });
                  },
                  color: selectedLevel == ActivityLevel.level_3
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  childContainer: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'High activity',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              '(3-4 workouts per week,',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              'physical work)',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BackgroundCard(
                  gesture: () {
                    setState(() {
                      selectedLevel = ActivityLevel.level_4;
                      returnedBMR = finalBMR();
                    });
                  },
                  color: selectedLevel == ActivityLevel.level_4
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  childContainer: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Very high activity',
                              textAlign: TextAlign.center,
                              style: kLabelTextStyle,
                            ),
                          ),
                          Text(
                            '(daily workouts)',
                            textAlign: TextAlign.center,
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0, right: 26.0),
            child: Divider(
              color: Colors.black,
              height: 16.0,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text('Your goal:',
                  style:
                      kResultsTitleTextStyle.copyWith(color: Colors.black87)),
            )),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              children: <Widget>[
                BackgroundCard(
                  gesture: () {
                    setState(() {
                      selectedGoal = WeightGoal.lose;
                      returnedBMR = finalBMR();
                    });
                  },
                  color: selectedGoal == WeightGoal.lose
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  childContainer: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Lose weight',
                            textAlign: TextAlign.center,
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BackgroundCard(
                  gesture: () {
                    setState(() {
                      selectedGoal = WeightGoal.keep;
                      returnedBMR = finalBMR();
                    });
                  },
                  color: selectedGoal == WeightGoal.keep
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  childContainer: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Keep weight',
                            textAlign: TextAlign.center,
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BackgroundCard(
                  gesture: () {
                    setState(() {
                      selectedGoal = WeightGoal.gain;
                      returnedBMR = finalBMR();
                    });
                  },
                  color: selectedGoal == WeightGoal.gain
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  childContainer: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Gain weight',
                            textAlign: TextAlign.center,
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0, right: 26.0),
            child: Divider(
              color: Colors.black,
              height: 16.0,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text('You should eat:', style: kResultsTitleTextStyle),
                )),
                BackgroundCard(
                  color: Color(0xFFE4EEFF),
                  childContainer: Container(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            returnedBMR.toStringAsFixed(0),
                            style: kBMRTextStyle,
                          ),
                          Text(
                            'kcal',
                            style: kKcalTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Button(
                    color: kBottomReturnButtonColor,
                    text: Text(
                      'RETURN',
                      style: TextStyle(
                        fontFamily: "Jaapokki",
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Button(
                    color: kBottomButtonColor,
                    text: Text(
                      'SHARE MY BMI AND DAILY GOAL',
                      style: TextStyle(
                        fontFamily: "Jaapokki",
                      ),
                    ),
                    onTap: () {
                      Share.share(
                          'My BMI score is ${widget.bmiResult}. I have ${widget.resultText.toLowerCase()}. I want eat ${returnedBMR.toStringAsFixed(0)} kcal daily.');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
