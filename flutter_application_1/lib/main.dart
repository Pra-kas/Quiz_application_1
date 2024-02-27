import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/view/sign_up.dart';


void main(){
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Padding(
          padding: const EdgeInsets.all(33.0),
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 25,
                    left: 25,
                    top: 30,
                    child: Container(
                      width: 305,
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("/home/prakash/Quiz_application_1/flutter_application_1/lib/component/util/logo.jpeg")
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    top: 450,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                         color: const Color.fromARGB(255, 101, 33, 113)
                      ),
                      child: Builder(
                        builder: (context) {
                          return TextButton(
                            child: const Text(
                                "Get started",
                                style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Signup()),
                              );
                            },
                          );
                        }
                      ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}