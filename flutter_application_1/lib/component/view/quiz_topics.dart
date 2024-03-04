// import 'package:flutter/material.dart';

// void main(){
//   runApp(const quizTopics());
// }

// class quizTopics extends StatefulWidget {
//   const quizTopics({super.key});

//   @override
//   State<quizTopics> createState() => _quizTopicsState();
// }

// class _quizTopicsState extends State<quizTopics> {
//     TextEditingController title = TextEditingController();
//     Future<dynamic> Alert_option() {
//     const List<String> collectionName = <String>['History', 'Maths', 'Biology', 'Programming'];
//     String dropDownValue = collectionName.first;
//     return showDialog(
//        context: context,
//        builder: (ctx) => AlertDialog(
//          title: const Text("Quiz Topics"),
//          content: DropdownButton<String>(
//               value: dropDownValue,
//               onChanged: (String? value) {
//                 dropDownValue = value!;
//                 setState(() {
//                   title.text = dropDownValue;
//               });
//             },
//             items: collectionName.map<DropdownMenuItem<String>>((String value){
//                return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(), 
//           ),

//          actions: <Widget>[

//          ],
//        ),
//      ).then((value) => value ?? false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Alert_option(),
//     );
//   }
// }