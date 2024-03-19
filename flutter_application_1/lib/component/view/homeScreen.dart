// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/view/create_quiz.dart';
import 'package:flutter_application_1/component/view/login.dart';
import 'package:flutter_application_1/component/view/quiz.dart';
import 'package:flutter_application_1/service/quiz_topics_api_call.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool recentquizes = true;
  static const List<String> collectionName = <String>['History', 'Maths', 'Biology', 'Programming', 'General knowledge', 'wild life'];
  static String title = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: width / 2),
                  child: const Text(
                    "Welcome back, User",
                    style: TextStyle(
                      color: Color.fromARGB(255, 51, 10, 121),
                      fontSize: 15,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height / 23, right: width / 2),
                  child: const Text(
                    "Let's play!",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 51, 10, 121),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height / 23, right: width/2),
                  child: const Text(
                    "All Categories ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 51, 10, 121),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top : height/70,left: 13,right: 13),
                  child: Container(
                    child: const Grid(showAll: true)),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height/25, right:width/2),
                  child: const Text(
                    "Recent Quizes",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 51, 10, 121),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // Padding(
                //   padding: EdgeInsets.only(top: height / 25),
                //   child: Center(child: recentQuizes(recentquizes)),
                // ),

                Padding(
                  padding: EdgeInsets.only(top: height / 25),
                  child: const Center(
                    child: Text("Do you want to create quizes ?"),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height / 25),
                  child: Center(
                    child: Builder(
                      builder: (context) {
                        return TextButton(
                          onPressed: () {
                            AlertOption(context);
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => QuizTitleDialog()));
                          },
                          child: const Text("Create"),
                        );
                      }
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

// ignore: non_constant_identifier_names
Future<void> AlertOption(context) async {
  String selectedTitle = collectionName.first;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: const Text("Quiz title"),
        actions: [
          DropdownButton<String>(
            value: selectedTitle,
            onChanged: (String? newValue) {
              setState(() {
                selectedTitle = newValue!;
                title = newValue;
                print(title);
              });
            },
            items: collectionName.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateQuiz(title: title)));
                },
                child: const Text("okey"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("cancel"),
              ),
            ],
          ),
        ],
      );
    },
  );
}


}

class Grid extends StatefulWidget {
  final bool showAll;

  const Grid({Key? key, required this.showAll}) : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      // padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 1.5,
      children:[
              category("General knowledge"),
              category("Maths"),
              category("Science"),
              category("Programming"),
              category("Sports"),
              category("wild life"),
            ],
    );
  }

  ElevatedButton category(String content) {
    print(content);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(30.0)
        )
      ),
      onPressed: () async {
        dynamic question = await getQuestions(content);
        if(question['status'] == true){
          question = question['message'];
          // ignore: use_build_context_synchronously
          Navigator.push(context, MaterialPageRoute(builder: ((context) => QuizContest(quizQuestions: question,))));
        }
        else if(question['message'] == 143){
          _showAlert(context, "Session expired please login again");
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const Login())));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Center(child: Text(content)),
      ),
    );
  }
}

void _showAlert(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}

// Widget recentQuizes(bool recentquizes) {
//   if (recentquizes) {
//     return Container(
//       width: 200,
//       height: 150,
//       color: Colors.greenAccent,
//       child: const Center(child: Text("History")),
//     );
//   } else {
//     return Container(
//       child: const Text("No past history"),
//     );
//   }
// }
