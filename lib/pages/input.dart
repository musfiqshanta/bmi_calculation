import 'package:bmi/pages/calculation.dart';
import 'package:bmi/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'roundbutton.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color inactivecolor = const Color.fromARGB(221, 33, 26, 26);
  Color active = const Color.fromRGBO(0, 0, 0, 1);
  bool click = false;
  Color? cardColor;
  int? value;
  Gender? selectGender;
  Color? malecolor;
  Color? femailcolor;
  double height = 120;
  int weight = 70;
  int age = 28;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {
                selectGender = Gender.male;
                setState(() {
                  if (selectGender == Gender.male) {
                    malecolor = active;
                    femailcolor = inactivecolor;
                  }
                });
              },
              child: UseCard(
                color: malecolor ?? inactivecolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "MALE",
                      style: textStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      FontAwesomeIcons.mars,
                      color: Colors.white70,
                      size: 50.0,
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                selectGender = Gender.female;
                setState(() {
                  if (selectGender == Gender.female) {
                    femailcolor = active;
                    malecolor = inactivecolor;
                  }
                });
              },
              child: UseCard(
                color: femailcolor ?? inactivecolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "FEMAIL",
                      style: textStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      FontAwesomeIcons.venus,
                      size: 50.0,
                      color: Colors.white70,
                    ),
                  ],
                ),
              ),
            ))
          ],
        )),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "HEIGHT",
              style: textStyle,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // _currentSliderValue.toString(),
                  height.round().toString(),
                  style: bigStyle,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "CM",
                  style: textStyle,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (height * 0.0328084).toStringAsFixed(1) + " Foot",
                  style: textStyle,
                ),
              ],
            ),
            SliderTheme(
              data: const SliderThemeData(
                  thumbColor: Colors.pink,
                  activeTrackColor: Colors.pink,
                  overlayColor: Color.fromARGB(107, 222, 39, 100),
                  inactiveTrackColor: Colors.white70),
              child: Slider(
                  max: 250,
                  //divisions: 1,
                  value: height.toDouble(),
                  onChanged: (double x) => setState(() {
                        height = x;
                      })),
            )
          ],
        )),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: UseCard(
                color: inactivecolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "WEIGHT",
                      style: textStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      weight.toString(),
                      style: bigStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundIconButton(
                          icon: Icons.remove,
                          onpressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        RoundIconButton(
                          icon: Icons.add,
                          onpressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                        // RoundIconButton(),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: UseCard(
                      color: inactivecolor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: textStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(age.toString(), style: bigStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                icon: Icons.remove,
                                onpressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: Icons.add,
                                onpressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              // RoundIconButton(),
                            ],
                          )
                        ],
                      ))),
            ],
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pink)),
          onPressed: () {
            BmiCalculation bmi = BmiCalculation(height: height, weight: weight);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Result(
                      bmir: bmi.bmical(),
                      msg: bmi.mess(),
                      recomanded: bmi.recomandation(),
                    )));
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Calculation",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 36),
                )),
          ),
        )
      ],
    );
  }
}

class UseCard extends StatelessWidget {
  const UseCard({Key? key, required this.cardChild, required this.color})
      : super(key: key);
  final Widget cardChild;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: cardChild,
    );
  }
}

const textStyle = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white70);
const bigStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 60.0, color: Colors.white);
