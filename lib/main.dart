// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_list.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
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
                        color: secondColor,
                        padding: EdgeInsets.symmetric(vertical: 18.00),
                        onPressed: () {},
                        child: Text(
                          questions[index].answer!.keys.toList()[i],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            }),
      ),
    );
  }
}
