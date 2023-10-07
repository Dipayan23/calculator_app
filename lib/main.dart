import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      userQuestion,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple[900],
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      userAnswer,
                      style: TextStyle(fontSize: 20),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion = '';
                        });
                      },
                      textcolor: const Color.fromARGB(255, 255, 255, 255),
                      bgcolor: Colors.green,
                      buttonText: buttons[index],
                    );
                  } else if (index == buttons.length-1) {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      textcolor: Colors.white,
                      bgcolor: Colors.deepPurple,
                      buttonText: buttons[index],
                    );
                  }
                  else if (index == 1) {
                    return MyButton(
                      buttonTapped: () {setState(() {
                        userQuestion=userQuestion.substring(0,userQuestion.length-1);
                      });
                        
                      },
                      textcolor: Colors.white,
                      bgcolor: Color.fromARGB(255, 246, 21, 21),
                      buttonText: buttons[index],
                    );
                  } else {
                    return MyButton(
                      buttonTapped: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      textcolor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.deepPurple,
                      bgcolor: isOperator(buttons[index])
                          ? Colors.deepPurple
                          : Colors.white,
                      buttonText: buttons[index],
                    );
                  }
                },
              ),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '+' || x == '-' || x == '/' || x == 'X' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  Future<void> equalPressed() async {
    String finalQuestion=userQuestion;
    finalQuestion=finalQuestion.replaceAll('X','*');
  Parser s = await Parser();
  Expression exp = s.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer=eval.toString();

  }
}
