import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/view/scoreBoard.dart';

class QuizContest extends StatefulWidget {
  final List<dynamic> quizQuestions; // List of questions

  const QuizContest({required this.quizQuestions, Key? key}) : super(key: key);

  @override
  State<QuizContest> createState() => _QuizContestState();
}

class _QuizContestState extends State<QuizContest> {
  late int currentQuestionIndex;
  late dynamic currentQuestion;
  String selectedOption = "";
  bool isOptionSelected = false;
  bool showCorrectAnswer = false;
  int correctScore = 0; // Counter for correct answers

  @override
  void initState() {
    super.initState();
    currentQuestionIndex = 0;
    loadCurrentQuestion();
  }

  // Function to load the current question
  void loadCurrentQuestion() {
    if (currentQuestionIndex < widget.quizQuestions.length) {
      currentQuestion = widget.quizQuestions[currentQuestionIndex];
    }
  }

  // Function to handle user's answer
  void handleAnswer(String selectedValue) {
    setState(() {
      if (!isOptionSelected) {
        selectedOption = selectedValue;
        isOptionSelected = true;
        showCorrectAnswer = true;

        // Check if the selected answer is correct
        if (selectedOption == currentQuestion['correctAnswer']) {
          correctScore++;
        }
      }

      if(currentQuestionIndex == 4){
            print("Hi broo");
            Navigator.push(context, MaterialPageRoute(builder: (context) => Score(score:correctScore)));
        }
    });
  }

  // Function to load the next question
  void loadNextQuestion() {
    setState(() {
      isOptionSelected = false;
      showCorrectAnswer = false;
      selectedOption = "";
      currentQuestionIndex++;

      // Load the next question if available
      loadCurrentQuestion();
    });
  }

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
                  child: questions(height, width, currentQuestion['question']),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: OptionA(height, width, currentQuestion['optionA']),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: OptionB(height, width, currentQuestion['optionB']),
                ),
                
                Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: OptionC(height, width, currentQuestion['optionC']),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height / 20),
                  child: OptionD(height, width, currentQuestion['optionD']),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height/20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Load the next question
                      loadNextQuestion();
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

  Container optionContainer(
      double height, double width, String value, String correctAnswer) {
    bool isCorrect = correctAnswer == selectedOption;
    bool isSelected = isOptionSelected && selectedOption == value;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        color: isSelected
            ? (isCorrect ? Colors.green : Colors.red)
            : (showCorrectAnswer && correctAnswer == value)
                ? Colors.green
                : null,
      ),
      height: height / 8,
      width: width,
      child: InkWell(
        onTap: () {
          // Handle user's answer
          handleAnswer(value);
        },
        child: Center(
          child: Text(value),
        ),
      ),
    );
  }

  Container OptionA(double height, double width, String value) {
    return optionContainer(
        height, width, value, currentQuestion['correctAnswer']);
  }

  Container OptionB(double height, double width, String value) {
    return optionContainer(
        height, width, value, currentQuestion['correctAnswer']);
  }

  Container OptionC(double height, double width, String value) {
    return optionContainer(
        height, width, value, currentQuestion['correctAnswer']);
  }

  Container OptionD(double height, double width, String value) {
    return optionContainer(
        height, width, value, currentQuestion['correctAnswer']);
  }
}
