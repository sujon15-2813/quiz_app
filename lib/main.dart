// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_list.dart';
import 'package:quiz_app/screens/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //color code
  Color mainColor = Color(0xFF252c4a);
  Color secondColor = Color(0xFF117eeb);
  // page controller
  PageController? _controller = PageController(initialPage: 0);
  //setting the game variable
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Color(0xFF117eeb);
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller!,
            onPageChanged: (Page) {
              setState(() {
                isPressed = false;
              });
            },
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Question ${index + 1} /${questions.length}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 28.0),
                    ),
                  ),
                  Divider(
                    height: 8.0,
                    thickness: 1.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    questions[index].question!,
                    style: TextStyle(color: Colors.white, fontSize: 28.0),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  for (int i = 0; i < questions[index].answer!.length; i++)
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 18.0),
                      child: MaterialButton(
                        shape: StadiumBorder(),
                        // padding: EdgeInsets.symmetric(
                        //     horizontal: 60.00, vertical: 18.00),
                        color: isPressed
                            ? questions[index].answer!.entries.toList()[i].value
                                ? isTrue
                                : isWrong
                            : secondColor,
                        padding: EdgeInsets.symmetric(vertical: 18.00),
                        onPressed: isPressed
                            ? () {}
                            : () {
                                setState(() {
                                  //btnColor = isWrong;
                                  isPressed = true;
                                });
                                if (questions[index]
                                    .answer!
                                    .entries
                                    .toList()[i]
                                    .value) {
                                  score += 10;
                                  print(score);
                                }
                              },
                        child: Text(
                          questions[index].answer!.keys.toList()[i],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                          onPressed: isPressed
                              ? index + 1 == questions.length
                                  ? () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ResultScreen(score)));
                                    }
                                  : () {
                                      _controller!.nextPage(
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.linear);
                                      setState(() {
                                        isPressed = false;
                                      });
                                    }
                              : null,
                          style: OutlinedButton.styleFrom(
                              shape: StadiumBorder(),
                              side: BorderSide(color: Colors.orange,width: 1.0),
                              ),
                          child: Text(
                            index + 1 == questions.length
                                ? "see result"
                                : 'Next Question',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
