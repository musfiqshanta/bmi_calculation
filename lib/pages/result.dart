// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmi/pages/input.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({Key? key, required this.bmir, required this.msg}) : super(key: key);

  String bmir;
  String msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("BMI CALCULATION"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Result",
              style: bigStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UseCard(
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Normal",
                        style: textStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        bmir,
                        style: bigStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Normal BMI Range",
                        style: textStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "18.4 - 25 kg/m2",
                        style: textStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        msg,
                        style: textStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  color: Color.fromARGB(221, 33, 26, 26)),
            )
          ],
        ));
  }
}
