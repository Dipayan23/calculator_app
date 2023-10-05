import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

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
            child: Container(),
          ),
          Expanded(
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index==0) {
                    return MyButton(
                    textcolor: const Color.fromARGB(255, 255, 255, 255),
                    bgcolor: Colors.green,
                    buttonText: buttons[index],
                  );
                  } else if(index==1){
                    return MyButton(
                    textcolor: Colors.white,
                    bgcolor: Colors.red,
                    buttonText: buttons[index],
                  );
                  }
                  else{
                    return MyButton(
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
}
