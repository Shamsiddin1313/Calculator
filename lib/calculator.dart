import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double? firstNum;
  double? secondNum;
  String? textToDisplay = "";
  String? res = "";
  String? operation = "";
  String history = "";

  void btnOnclick(String btnVal) {
    if (btnVal == '%') {
      res = (int.tryParse(res!)! / 100).toString();
      btnVal = "";
    }
    if (btnVal == "+/-") {
      res = !int.tryParse(res!)!.isNegative ? "-$textToDisplay" : textToDisplay;
      btnVal = "";
    }

    if (btnVal == "AC") {
      textToDisplay = "";
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '+' ||
        btnVal == "-" ||
        btnVal == "x" ||
        btnVal == "/") {
      res = "";
      firstNum = double.parse(textToDisplay!);
      operation = btnVal;
    } else if (btnVal == "=") {
      secondNum = double.parse(textToDisplay!);
      if (operation == "+") {
        res = (firstNum! + secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == "-") {
        res = (firstNum! - secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == "x") {
        res = (firstNum! * secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == "/") {
        res = (firstNum! / secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      } else if (btnVal == ".") {
        if (res.toString().contains(".")) {
          res = res.toString() + ".";
        }
      }
    } else {
      res = (res! + btnVal);
    }
    setState(() {
      textToDisplay = res;
    });
  }

  Widget calcbutton(
    String btntxt,
    Color btncolor,
    Color txtcolor,
  ) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(shape: BoxShape.circle, color: btncolor),
      child: TextButton(
          onPressed: () {
            btnOnclick(btntxt);
          },
          child: Text(
            btntxt,
            style: TextStyle(fontSize: 35, color: txtcolor),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 340),
                child: Text(
                  history,
                  textAlign: TextAlign.end,
                  style: const TextStyle(fontSize: 25, color: Colors.grey),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      textToDisplay!,
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton(
                    "AC",
                    Colors.grey,
                    Colors.black,
                  ),
                  calcbutton("+/-", Colors.grey, Colors.black),
                  calcbutton("%", Colors.grey, Colors.black),
                  calcbutton("/", Colors.amber.shade400, Colors.white),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton("7", Colors.grey.shade800, Colors.white),
                  calcbutton("8", Colors.grey.shade800, Colors.white),
                  calcbutton("9", Colors.grey.shade800, Colors.white),
                  calcbutton("x", Colors.amber.shade400, Colors.white),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton("4", Colors.grey.shade800, Colors.white),
                  calcbutton("5", Colors.grey.shade800, Colors.white),
                  calcbutton("6", Colors.grey.shade800, Colors.white),
                  calcbutton("-", Colors.amber.shade400, Colors.white),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton("1", Colors.grey.shade800, Colors.white),
                  calcbutton("2", Colors.grey.shade800, Colors.white),
                  calcbutton("3", Colors.grey.shade800, Colors.white),
                  calcbutton("+", Colors.amber.shade400, Colors.white),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        btnOnclick("0");
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 90),
                      height: 75,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade800),
                      child: const Center(
                        child: Text(
                          "0",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  calcbutton(".", Colors.grey.shade800, Colors.white),
                  calcbutton("=", Colors.amber.shade400, Colors.white),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
