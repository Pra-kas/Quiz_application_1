import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/view/sign_up.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  child: Container(
                    height: height/3,
                    width: width/2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("/home/prakash/Quiz_application_1/flutter_application_1/lib/component/util/logo.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
