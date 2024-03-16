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
                        isAnswer = true;
                        isAnswerSubmitted = false;
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

int isCorrect = 0;
bool isAnswerSubmitted = false;
bool isAnswer = true;

Container optionContainer(double height, double width, String value) {
  Color defaultColor = const Color.fromARGB(255, 238, 236, 236); // Set the default color
  Color selectedColor = Colors.blue; // Set the color for the selected option
  
  return Container(
    height: height / 8,
    width: width,
    child: ElevatedButton(
      onPressed: isAnswer ? (){
        setState(() async {
          if (!isAnswerSubmitted) {
            // Process the click action only if the answer has not been submitted yet
            selectedOption = value;
            isAnswerSubmitted = true; // Mark the answer as submitted
            isAnswer = false; // Set isAnswer to false to disable further taps
            print("Why bro?");
            try {
              isCorrect = await correct_answer(selectedOption, index);
            } catch(error) {
              print(error);
            }
            print("Why bro?");
            if(isCorrect == 1) correctScore++;
            print(correctScore);
          }
        });
      } : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              // Change color when pressed
              return selectedColor;
            } else {
              // Change color based on whether the option is selected or not
              return selectedOption == value ? selectedColor : defaultColor;
            }
          },
        ),
      ),
      child: Center(
        child: Text(
          value,
          style: TextStyle(
            color: selectedOption == value ? Colors.white : Colors.black, // Change text color based on whether the option is selected or not
          ),
        ),
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
