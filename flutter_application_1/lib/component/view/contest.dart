import 'package:flutter/material.dart';

void main() {
  runApp(const QuizContest());
}

class QuizContest extends StatefulWidget {
  const QuizContest({Key? key}) : super(key: key);

  @override
  State<QuizContest> createState() => _QuizContestState();
}

class _QuizContestState extends State<QuizContest> {
  String selectedOption = "";
  bool isOptionSelected = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height / 10),
                  child: questions(height, width),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: OptionA(height, width, "Option A"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: OptionB(height, width, "Option B"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: OptionC(height, width, "Option C"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: OptionD(height, width, "Option D"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container questions(double height, double width) {
    return Container(
      height: height / 6,
      width: width,
      child: const Card(
        child: Center(
          child: Text(
            "Question",
          ),
        ),
      ),
    );
  }

  Container optionContainer(double height, double width, String value) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        color: (selectedOption == value) ? Colors.green : 
            (isOptionSelected) ? const Color.fromARGB(255, 245, 231, 231) : null,
      ),
      height: height / 8,
      width: width,
      child: InkWell(
        onTap: () {
          setState(() {
            if (!isOptionSelected) {
              selectedOption = value;
              isOptionSelected = true;
            }
          });
        },
        child: Center(
          child: Text(value),
        ),
      ),
    );
  }

  Container OptionA(double height, double width, String value) {
    return optionContainer(height, width, value);
  }

  Container OptionB(double height, double width, String value) {
    return optionContainer(height, width, value);
  }

  Container OptionC(double height, double width, String value) {
    return optionContainer(height, width, value);
  }

  Container OptionD(double height, double width, String value) {
    return optionContainer(height, width, value);
  }
}
