import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/view/scoreBoard.dart';
import 'package:flutter_application_1/service/question_validation.dart';

class QuizContest extends StatefulWidget {
  final List<dynamic> quizQuestions; // List of questions

  const QuizContest({required this.quizQuestions, Key? key}) : super(key: key);

  @override
  State<QuizContest> createState() => _QuizContestState();
}

class _QuizContestState extends State<QuizContest> {
  String selectedOption = "";
  bool isOptionSelected = false;
  bool showCorrectAnswer = false;
  int index = 0;
  int correctScore = 0; // Counter for correct answers


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
                  child: questions(height, width,widget.quizQuestions[index]["question"]),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: OptionA(height, width, widget.quizQuestions[index]['optionA']),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: OptionB(height, width, widget.quizQuestions[index]['optionB']),
                ),
                
                Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: OptionC(height, width, widget.quizQuestions[index]['optionC']),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: OptionD(height, width, widget.quizQuestions[index]['optionD']),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height/20),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isOptionSelected = false;
                        if(index == 4){
                          print("Reached");
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Score(score: correctScore)));
                        }
                        index++;
                      });
                    },
                    child: const Text("Next Question"),
                  ),
                ),
                // SizedBox(height: 20),
                // Text("Correct Score: $correctScore"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container questions(double height, double width, String questions) {
    return Container(
      height: height / 6,
      width: width,
      child: Card(
        child: Center(
          child: Text(
            questions,
          ),
        ),
      ),
    );
  }


Container optionContainer(double height, double width, String value) {
  int isCorrect = 0;

  return Container(
    height: height / 8,
    width: width,
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(20),
      color: isCorrect == 1 ? Colors.green : Colors.red,
    ),
    child: InkWell(
      onTap: isOptionSelected ? null : () {
        setState(() async {
          selectedOption = value;
          isOptionSelected = true; // Mark an option as selected
          print("why brro");
          try{isCorrect = await correct_answer(selectedOption,index);}
          catch(error){
            print(error);
          }
          print("why brro");
          if(isCorrect == 1) correctScore++;
          print(correctScore);
        });
        // Handle user's answer
        // handleAnswer(value);
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
