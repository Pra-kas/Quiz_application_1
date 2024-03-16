// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/view/homepage.dart';

class Score extends StatefulWidget {
  final dynamic score;

  const Score({required this.score, Key? key}) : super(key: key);

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: EdgeInsets.only(top: height / 10),
                child: Container(
                  width: width,
                  height: height / 10,
                  child: Center(
                    child: Text(
                      "Your score",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: height / 20,
                        decorationColor: Colors.amberAccent,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: height / 10),
                child: SizedBox(
                  height: height / 8,
                  width: height / 8,
                  child: CircularProgressIndicator(
                    value: (widget.score / 5).toDouble(), // Access widget.score here
                    color: Colors.blueAccent,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: height / 20),
                child: Container(
                  width: width,
                  height: height / 10,
                  child: Center(
                    child: Text(
                      "${widget.score} / 5", // Access widget.score here
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: height / 20,
                        decorationColor: Colors.amberAccent,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: height / 10),
                child: Container(
                  width: height / 8,
                  height: height / 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(height / 20),
                  ),
                  child: ElevatedButton(
                    child: const Text("Next"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
