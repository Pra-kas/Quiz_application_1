// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showAllCategories = false;
  bool recentquizes = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Column(
              children: <Widget>[
                // Padding(
                //   padding: EdgeInsets.only(left: width / 2),
                //   child: const Text(
                //     "Welcome back, User",
                //     style: TextStyle(
                //       color: Color.fromARGB(255, 51, 10, 121),
                //       fontSize: 15,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(top: height / 20, left: width / 2),
                //   child: const Text(
                //     "Let's play!",
                //     style: TextStyle(
                //       fontSize: 30,
                //       color: Color.fromARGB(255, 51, 10, 121),
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(top: height / 20),
                //   child: const Text(
                //     "Hot Categories ",
                //     style: TextStyle(
                //       fontSize: 20,
                //       color: Color.fromARGB(255, 51, 10, 121),
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(top: height / 20, right: width / 3),
                //   child: TextButton(
                //     onPressed: () {
                //       setState(() {
                //         showAllCategories = !showAllCategories;
                //       });
                //     },
                //     child: const Text("See All"),
                //   ),
                // ),
                Flexible(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.green,
                      ),

                       Container(
                        width: 200,
                        height: 200,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
                // const Text(
                //   "Recent Quizes",
                //   style: TextStyle(
                //     fontSize: 20,
                //     color: Color.fromARGB(255, 51, 10, 121),
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(top: height / 20),
                //   child: Center(child: recentQuizes(recentquizes)),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(top: height / 20),
                //   child: const Center(
                //     child: Text("Do you want to create quizes ?"),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(top: height / 20),
                //   child: Center(
                //     child: TextButton(
                //       onPressed: () {},
                //       child: const Text("Create"),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
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
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 1.5,
      children: widget.showAll
          ? [
              category("History"),
              category("Maths"),
              category("Science"),
              category("Computer"),
            ]
          : [
              category("History"),
              category("Maths"),
            ],
    );
  }

  Container category(String content) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 218, 215, 215),
      ),
      child: Center(child: Text(content)),
    );
  }
}

Widget recentQuizes(bool recentquizes) {
  if (recentquizes) {
    return Container(
      width: 200,
      height: 150,
      color: Colors.greenAccent,
      child: const Center(child: Text("History")),
    );
  } else {
    return Container(
      child: const Text("No past history"),
    );
  }
}
