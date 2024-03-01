import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/view/homeScreen.dart';

void main() {
  runApp(const CreateQuiz());
}

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key});

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

   static List<Map<String, String>> obj = [];


  @override
  Widget build(BuildContext context) {
    TextEditingController A = TextEditingController();
    TextEditingController B = TextEditingController();
    TextEditingController C = TextEditingController();
    TextEditingController answer = TextEditingController();
    TextEditingController D = TextEditingController();
    TextEditingController title = TextEditingController();
    TextEditingController question = TextEditingController();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool x = width > height;
    
    // ignore: non_constant_identifier_names
    SizedBox question_quiz(double height, double width,TextEditingController question) {
    return SizedBox(
       height: height/3,
       width: width,
       child: Card(
         color: Colors.deepPurpleAccent,
         child: question_method(question),
       ),
     );
  }

  // Container quizOption(String option, TextEditingController name) {
  //   return Container(
  //     // height: height,
  //     // width: width,
  //     child: Card(
  //       color: (option == 'A') ? Colors.redAccent : (option == 'B') ? Colors.greenAccent : (option == 'C') ? Colors.blueAccent : Colors.yellowAccent,
  //       child: Padding(
  //         padding: const EdgeInsets.all(28.0),
  //         child: Center(
  //           child: TextField(
  //             textAlign: TextAlign.center,
  //             decoration: InputDecoration(
  //               hintText: "Option $option",
  //               border: InputBorder.none
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(height / 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: EdgeInsets.only(top: height / 40),
                  child: question_quiz(height, width, question),
                ),

                Padding(
                  padding: EdgeInsets.only(top: height / 10),
                  child: Expanded(
                    child: SizedBox(
                      height: height,
                      width: height,
                      child: Column(
                        children: [

                          Padding(
                            padding: EdgeInsets.only(top: height/40),
                            child: Expanded(
                              child: OptionA(A)
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: height/40),
                            child: Expanded(
                              child: OptionB(B)
                            ),
                          ),
                          
                          Padding(
                            padding: EdgeInsets.only(top: height/40),
                            child: Expanded(
                              child: OptionC(C)
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: height/40),
                            child: Expanded(
                              child: OptionD(D)
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: height/40),
                            child: Expanded(
                              child: Question(answer)
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.arrow_left_rounded
                      )
                    ),

                    Builder(
                      builder: (context) {
                        return ElevatedButton(
                          onPressed: () {
                              Alert_option(context, title);
                            print(obj);
                          },
                          child: const Text(
                            "Save",
                          )
                        );
                      }
                    ),

                    Builder(
                      builder: (context) {
                        return next_button(question, A, B, C, D, answer);
                      }
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Center question_method(TextEditingController question) {
    return Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: question,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Question..."
              ),
            ),
          ),
       );
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> Alert_option(BuildContext context, TextEditingController title) {
    return showDialog(
       context: context,
       builder: (ctx) => AlertDialog(
         title: const Text("Quiz Title"),
         content: TextField(
           controller: title,
           decoration: const InputDecoration(
             hintText : "quiz title..",
           ),
         ),

         actions: <Widget>[
           okey_button(context, title),

           Builder(
             builder: (context) {
               return Cancel_button(ctx);
             }
           ),
         ],
       ),
     );
  }

  // ignore: non_constant_identifier_names
  TextButton okey_button(BuildContext context, TextEditingController title) {
    return TextButton(
           onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
             print(title.text.trim());
           },
           child: Container(
             color: Colors.green,
             padding: const EdgeInsets.all(14),
             child: const Text("okay"),
           ),
         );
  }

  // ignore: non_constant_identifier_names
  TextButton Cancel_button(BuildContext ctx) {
    return TextButton(
               onPressed: () {
                 Navigator.of(ctx).pop();
               },
               child: Container(
                 color: Colors.green,
                 padding: const EdgeInsets.all(14),
                 child: const Text("cancel"),
               ),
             );
  }

  // ignore: non_constant_identifier_names
  ElevatedButton next_button(TextEditingController question, TextEditingController A, TextEditingController B, TextEditingController C, TextEditingController D, TextEditingController answer) {
    return ElevatedButton(
      onPressed: () {
      setState(() {
          // print("${question.text} ${A.text} ${B.text} ${C.text} ${D.text} ");
          // print("Prakash");
          obj.add(
            {
             "question" : question.text.trim(),
             "A" : A.text.trim(),
             "B" : B.text.trim(),
             "C" : C.text.trim(),
             "D" : D.text.trim(),
             "answer" : answer.text.trim(),
           }
         );
        //  print(obj);
       });
     },
     child: const Icon(
       Icons.arrow_right_rounded,
     )
   );
  }

  Container Question(TextEditingController answer) {
    return Container(
    child: Card(
      color: Colors.white.withAlpha(77),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: TextField(
          controller: answer,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText: "Correct Option",
            border: InputBorder.none
          ),
        ),
      ),
    ),
  );
}

  Container OptionD(TextEditingController D) {
    return Container(
    child: Card(
      color: Colors.yellowAccent,
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: TextField(
          controller: D,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText: "Option D",
            border: InputBorder.none
          ),
        ),
      ),
    ),
  );
}

  Container OptionC(TextEditingController C) {
    return Container(                       
    child: Card(
      color:  Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: TextField(
          controller: C,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText: "Option C",
            border: InputBorder.none
          ),
        ),
      ),
    ),
  );
}

  Container OptionB(TextEditingController B) {
    return Container(              
    child: Card(
      color:  Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: TextField(
          controller: B,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText: "Option B",
            border: InputBorder.none
          ),
        ),
      ),
    ),
  );
}

  Container OptionA(TextEditingController A) {
    return Container(
      child: Card(
        color: Colors.redAccent,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: TextField(
            controller : A,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: "Option A",
              border: InputBorder.none
            ),
          ),
        ),
      ),
    );
  }
}


