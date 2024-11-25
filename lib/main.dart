import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayText = '0';

  void onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        displayText = '0';
      } else if (value == '=') {
        try {
          displayText = (double.parse(displayText).toString());
        } catch (e) {
          displayText = 'Error';
        }
      } else {
        if (displayText == '0') {
          displayText = value;
        } else {
          displayText += value;
        }
      }
    });
  }

  Widget buildButton(String value, Color textColor) {
    return SizedBox(
      width: 70, // Button width
      height: 70, // Button height
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // Slightly rounded corners
          ),
        ),
        onPressed: () => onButtonPressed(value),
        child: Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(40.0),
            padding: const EdgeInsets.all(12.0),
            alignment: Alignment.centerLeft,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
              border: Border.all(color: Colors.grey, width: 1.5),
            ),
            child: Text(
              displayText,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('1', Colors.black),
                  buildButton('2', Colors.black),
                  buildButton('3', Colors.black),
                  buildButton('C', Colors.red),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('4', Colors.black),
                  buildButton('5', Colors.black),
                  buildButton('6', Colors.black),
                  buildButton('+', Colors.red),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('7', Colors.black),
                  buildButton('8', Colors.black),
                  buildButton('9', Colors.black),
                  buildButton('-', Colors.red),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 70), // Empty space for alignment
                  buildButton('0', Colors.black),
                  buildButton('.', Colors.red),
                  buildButton('=', Colors.red),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

