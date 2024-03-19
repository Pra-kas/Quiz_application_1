import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/view/Leaderboard.dart';
import 'package:flutter_application_1/component/view/create_quiz.dart';
import 'package:flutter_application_1/component/view/homeScreen.dart';
import 'package:flutter_application_1/component/view/login.dart';
import 'package:flutter_application_1/component/view/quiz.dart';
import 'package:flutter_application_1/component/view/scoreBoard.dart';
import 'package:flutter_application_1/component/view/sign_up.dart';
import 'package:flutter_application_1/component/view/user_profile.dart';


void main() {
  var app = MaterialApp(
    debugShowCheckedModeBanner: true,
    initialRoute: "mainhomepage",
    routes: {
      "mainhomepage" :(context) => const MainHomePage(),
      "loginpage" :(context) => const Login(),
      "signup" :(context) => const Signup(),
      "homepage" :(context) => const HomeScreen(),
      "quizcreate" :(context) => const CreateQuiz(title: ""),
      "attendquiz" :(context) => const QuizContest(quizQuestions: []),
      "score" :(context) => const Score(score: 0),
      "profile" :(context) => const ProfileScreen(),
      "leaderboard" :(context) => const Leaderboard()
    },
  );
  runApp(app);
}


class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                
                Center(
                  child: quiz_logo(height, width),
                ),

                get_started_button(width, height)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container get_started_button(double width, double height) {
    return Container(
      height: width/8,
      width: height/2,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 94, 32, 105),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Builder(
        builder: (context) {
          return TextButton(
            onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signup()), 
              );
            },
            child: const Text(
              "Get Started",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            ),
          );
        }
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container quiz_logo(double height, double width) {
    return Container(
      height: height/3,
      width: width/2,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("/home/prakash/Quiz_application_1/flutter_application_1/lib/component/util/logo.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

  //  Future<String?> getSessionToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("session");
  // }