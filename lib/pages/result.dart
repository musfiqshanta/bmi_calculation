import 'package:bmi/pages/input.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key,
      required this.bmir,
      required this.msg,
      required this.recomanded})
      : super(key: key);

  final String bmir;
  final Widget msg;
  final String recomanded;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.pinkAccent,
          title: const Text("Get Your Result"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your Result",
              style: bigStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UseCard(
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      msg,
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        bmir,
                        style: bigStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Normal BMI Range",
                        style: textStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "18.4 - 25 kg/m2",
                        style: textStyle,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Normal Weight For You",
                        style: textStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        recomanded,
                        style: textStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  color: const Color.fromARGB(221, 33, 26, 26)),
            )
          ],
        ),
      ),
    );
  }
}
