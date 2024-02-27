// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showAllCategories = false;
  bool recentquizes = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 140, 135, 135),
            width:double.maxFinite,
            height: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(23.0),
              child: Stack(
                children: <Widget>[
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Welcome back, User",
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 10, 121),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 35,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Let's play!",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 51, 10, 121),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Text(
                      "Hot Categories ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 51, 10, 121),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    right: 0,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showAllCategories = !showAllCategories;
                        });
                      },
                      child: const Text("See All"),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Grid(showAll: showAllCategories),
                  ),
                  Positioned(
                    top: showAllCategories ? screenHeight * 0.52 : screenHeight * 0.35,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         const Text(
                          "Recent Quizes",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 51, 10, 121),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(child: recentQuizes(recentquizes)),
                        const SizedBox(height: 50),
                        const Center(
                          child: Text(
                            "Do you want to create quizes ?"
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("Create"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
        color: Colors.white
      ),
      child: Center(child: Text(content)),
    );
  }
}

Container recentQuizes(bool recentquizes){
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
