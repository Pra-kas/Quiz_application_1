import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/view/homepage.dart';
import 'package:flutter_application_1/component/view/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: [
                Positioned(
                  left: 25,
                  right: 25,
                  child: Container(
                    width: 210,
                    height: 210,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("/home/prakash/Quiz_application_1/flutter_application_1/lib/component/util/logo.jpeg"),
                      )
                    ),
                  ),
                ),
                 Positioned(
                  top: 200,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "    Email",
                              icon: Icon(Icons.email)
                            ),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: const TextField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              hintText: "    Password",
                              border: InputBorder.none,
                              icon: Icon(Icons.password),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: const TextField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              hintText: "    confirmPassword",
                              border: InputBorder.none,
                              icon: Icon(Icons.password_outlined)
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 150,
                              height: 40,
                              decoration: const BoxDecoration(
                                
                              ),
                              child: TextButton(
                                child: const Text("Forgot password"),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 101, 33, 113)
                          ),
                          child: TextButton(
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const HomePage())    
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             const Text(
                              "Already have an account ?",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                             ),
                            Builder(
                              builder: (context) {
                                return TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const Login()), 
                                    );
                                  }, 
                                  child: const Text("Sign in"));
                              }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                 )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}