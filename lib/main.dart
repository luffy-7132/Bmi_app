// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: MyHomePgae(),
    );
  }
}

class MyHomePgae extends StatefulWidget {
  const MyHomePgae({super.key});

  @override
  State<MyHomePgae> createState() => _MyHomePgaeState();
}

class _MyHomePgaeState extends State<MyHomePgae> {
  TextEditingController kgController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();

  String result = "";
  var msg = "";

  ///over red
  ///under yellow
  ///healthy green
  var bgColor = Colors.grey.shade100;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Scaffold(
          backgroundColor: bgColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'BMI Calculator',
                  style: TextStyle(fontSize: 30),
                ),

                ///KG Weight
                TextField(
                  controller: kgController,
                  decoration: InputDecoration(
                      label: Text('Enter Your Weight'),
                      prefixIcon: Icon(Icons.line_style),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),

                ///Feet
                TextField(
                  controller: feetController,
                  decoration: InputDecoration(
                      label: Text('Enter Your Height (Feet)'),
                      prefixIcon: Icon(Icons.line_style),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),

                ///Inch
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.line_style),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                      label: Text('Enter Your Height (Inch)'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),

                ///calculate
                ElevatedButton(
                  onPressed: () {
                    var wt = kgController.text.toString();
                    var ft = feetController.text.toString();
                    var inch = inchController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      //BMI Calculator
                      var iWt = double.parse(wt);
                      var iFt = double.parse(ft);
                      var iInch = double.parse(inch);

                      var tInch = (iFt * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;
                      var bmi = iWt / (tM * tM);
                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are overWeight!!";
                        bgColor = Colors.red.shade200;
                      } else if (bmi < 10) {
                        msg = "You are underWeight!!";
                        bgColor = Colors.yellow.shade300;
                      } else {
                        msg = "You are Healthy!!";
                        bgColor = Colors.green;
                      }

                      setState(() {
                        result =
                            "$msg\n\n Your BMI is ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please Fill all the fields!!!!!";
                      });
                    }
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 30),
                  ),
                  style: ElevatedButton.styleFrom(minimumSize: Size(500, 70)),
                ),

                Text(
                  '${msg} ${result}',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
