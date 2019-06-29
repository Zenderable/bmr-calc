import 'package:flutter/material.dart';
import 'package:check_your_bmr_and_bmi/constants.dart';
import 'package:check_your_bmr_and_bmi/components/background_card.dart';
import 'package:check_your_bmr_and_bmi/components/buttons.dart';

class SecondPage extends StatelessWidget {
  final String bmrResult;
  final String bmiResult;
  final String resultText;
  final String interpretation;
  SecondPage(
      {this.resultText, this.interpretation, this.bmiResult, this.bmrResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Center(
          child: Text('Check Your BMR and BMI'),
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
              padding: const EdgeInsets.only(left: 12.0),
              child: Text('Your BMI', style: kResultsTitleTextStyle),
            )),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: BackgroundCard(
                    color: Color(0xFFE4EDFF),
                    childContainer: Center(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Center(
                          child: Text(
                            bmiResult,
                            style: kBMITextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: BackgroundCard(
                    color: Color(0xFFE3FFEE),
                    childContainer: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          resultText.toUpperCase(),
                          style: kResultsTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: BackgroundCard(
              color: Color(0xFFEDE4FE),
              childContainer: Container(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      SizedBox(height: 10.0),
                      Text(
                        'What does it mean?',
                        style: kWhatItMean,
                      ),
                      Text(
                        interpretation,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
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
                child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text('Your BMR', style: kResultsTitleTextStyle),
            )),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: BackgroundCard(
                      color: Color(0xFFFEEAEA),
                      childContainer: Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                bmrResult,
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
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: BackgroundCard(
                      color: kActiveCardColor,
                      childContainer: Container(
                        child: Center(
                          child: Text(
                            'This is your minimum to live!',
                            style: kBMRWarning,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        height: double.infinity,
                        width: double.infinity,
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
                    text: Text('RETURN'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Button(
                    color: kBottomButtonColor,
                    text: Text('CHECK MORE'),
                    onTap: null,
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
