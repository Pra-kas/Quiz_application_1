import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/view/homepage.dart';
import 'package:flutter_application_1/component/view/sign_up.dart';
import 'package:flutter_application_1/service/login_validation.dart';

void main(){
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Object orientation = MediaQuery.of(context).orientation;
    bool x = (orientation == 'Landscape');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Column(
              children: [
                    Padding(
                      padding: EdgeInsets.only(left: width/10,right: width/10),
                      child: Container(
                        width: (!x) ? width/2 : height/3,
                        height: (!x) ? height/3 : width/2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("/home/prakash/Quiz_application_1/flutter_application_1/lib/component/util/logo.jpeg"),
                          )
                        ),
                      ),
                    ),
                    //  const SizedBox(
                    //    height: 20,
                    //  ),
                     Padding(
                       padding: EdgeInsets.only(top: height/20),
                       child: Container(
                         width: (!x) ? width : height/20,
                         height: (!x) ? height/20 : width,
                         decoration:  BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           shape: BoxShape.rectangle,
                           color: Colors.white,
                         ),
                         child: TextField(
                           controller: email,
                           decoration: const InputDecoration(
                             border: InputBorder.none,
                             hintText: "Email",
                             icon: Icon(Icons.email)
                           ),
                         ),
                       ),
                     ),
                    //  const SizedBox(
                    //    height: 20,
                    //  ),
                     Padding(
                       padding: EdgeInsets.only(top: height/20),
                       child: Container(
                         height: (!x) ? height/20 : width,
                         width: (!x) ? width : height/20,
                         decoration: BoxDecoration(
                           shape: BoxShape.rectangle,
                           borderRadius: BorderRadius.circular(10),
                           color: Colors.white
                         ),
                         child: TextField(
                           textAlign: TextAlign.start,
                           controller: password,
                           decoration: const InputDecoration(
                             hintText: "Password",
                             border: InputBorder.none,
                             icon: Icon(Icons.password)
                           ),
                           obscureText: true,
                         ),
                       ),
                     ),
                    //  const SizedBox(
                    //    height: 20,
                    //  ),
                     Padding(
                       padding: EdgeInsets.only(top: height/20),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           Container(
                             width: (!x) ? width/2 : height/15,
                             height: (!x) ? height/15 : width/2,
                             decoration: const BoxDecoration(
                               
                             ),
                             child: Container(
                              width: height/20,
                              height: width/10,
                               child: TextButton(
                                 child: const Text("Forgot password"),
                                 onPressed: () {},
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                    //  const SizedBox(
                    //    height: 20,
                    //  ),
                     Padding(
                       padding: EdgeInsets.only(top: ((!x) ? height/20 : width/30)),
                       child: Container(
                         width: (!x) ? width : height/15,
                         height: (!x) ? height/15 : width,
                         decoration: BoxDecoration(
                           shape: BoxShape.rectangle,
                           borderRadius: BorderRadius.circular(10),
                           color: const Color.fromARGB(255, 101, 33, 113)
                         ),
                         child: Builder(
                           builder: (context) {
                             return TextButton(
                               child: const Text(
                                 "Login",
                                 style: TextStyle(
                                   color: Colors.white,
                                 ),
                               ),
                               onPressed: () async {
                                if(await validateUser(email,password)){
                                  Navigator.push(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    MaterialPageRoute(builder: (context) => const HomePage()),
                                  );
                                }
                                else{
                                  Navigator.push(
                                    // ignore: use_build_context_synchronously
                                    context,
                                    MaterialPageRoute(builder: (context) => const Signup()),
                                  );
                                }
                               },
                             );
                           }
                         ),
                       ),
                     ),
                    //  const SizedBox(
                    //    height: 90,
                    //  ),
                     Padding(
                       padding: EdgeInsets.only(top:((!x)?height/20 : width/30)),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                            Container(
                              alignment: Alignment.center,
                              child: const Text(
                               "Don't have an account?",
                               style: TextStyle(
                                 fontSize: 15,
                               ),
                              ),
                            ),
                           Builder(
                             builder: (context) {
                               return TextButton(
                                 onPressed: () {
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => const Signup())
                                   );
                                 },
                               child: const Text("Sign Up"));
                             }
                           ),
                         ],
                      ),
                  ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}