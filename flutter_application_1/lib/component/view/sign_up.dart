import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/view/homepage.dart';
import 'package:flutter_application_1/component/view/login.dart';
import 'package:flutter_application_1/service/sign_up_validation.dart';

void main(){
  runApp(const Signup());
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conformpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Object orientation = MediaQuery.of(context).orientation;
    bool x = (orientation == 'Landscape');
    print(orientation);
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Column(
              children: [

              Padding(
                padding: EdgeInsets.only(left: width/10,right: width/10),
                child: sign_up_logo(width, height),
              ),

               Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Expanded(
                    child: sign_up_email(x, width, height),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Expanded(
                    child: sign_up_password(x, height, width),
                  ),
                ),
                   
                Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: Expanded(
                    child: sign_up_conform_password(x, height, width),
                  ),
                 ),
                 
                Padding(
                  padding: EdgeInsets.only(top: height/25),
                  child: Expanded(
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
                          return sign_up_button(context);
                          }
                        ),
                      ),
                    ),
                  ),
             
                     Padding(
                       padding: EdgeInsets.only(top: height/15),
                       child: Expanded(
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                              Container(
                               alignment: Alignment.centerRight,
                                height: (!x) ? height/15 : width/2,
                                width: (!x) ? width/2 : height/15,
                                child: const Text(
                                 "Already have an account ?",
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
                                    MaterialPageRoute(builder: (context) => const Login()), 
                                );
                              }, 
                                child: const Text("Sign in"));
                            }
                          ),
                        ],
                      ),
                    ),
                  ),
               ]
            ),
          ),
        ),
      );
  }

TextButton sign_up_button(BuildContext context) {
  return TextButton(
    child: const Text(
      "Sign up",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    onPressed: () async {
      int validationResult = await validateUser(email, password, conformpassword);

      if (validationResult == 400) {
        _showAlert(context, "Invalid email format");
      }else if (validationResult == 304) {
        _showAlert(context, "Password must be at least 8 characters long");
      } else if (validationResult == 104) {
        _showAlert(context, "Password do not match");
      } else if(validationResult == 404){
        _showAlert(context, "Email id is already taken");
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage())
        );
      }
    },
  );
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


  Container sign_up_conform_password(bool x, double height, double width) {
    return Container(
      height: (!x) ? height/15 : width,
      width: (!x) ? width : height/15,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        ),
        child: TextField(
        obscureText: true,
        controller: conformpassword,
        textAlign: TextAlign.start,
        decoration: const InputDecoration(
          hintText: "confirmPassword",
          border: InputBorder.none,
          icon: Icon(Icons.password_outlined)
        ),
      ),
    );
  }

  Container sign_up_password(bool x, double height, double width) {
    return Container(
       height: (!x) ? height/15 : width,
       width: (!x) ? width : height/15,
       decoration: BoxDecoration(
         shape: BoxShape.rectangle,
         borderRadius: BorderRadius.circular(10),
         color: Colors.white,
       ),
       child: TextField(
        obscureText: true,
         controller: password,
         textAlign: TextAlign.start,
         decoration: const InputDecoration(
           hintText: "Password",
           border: InputBorder.none,
           icon: Icon(Icons.password),
         ),
       ),
     );
  }

  Container sign_up_email(bool x, double width, double height) {
    return Container(
       width: (!x) ? width : height/15,
       height: (!x) ? height/15 : width,
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
     );
  }

  Container sign_up_logo(double width, double height) {
    return Container(
     width: width/1.6,
     height: height/3,
     decoration: const BoxDecoration(
       // color: Colors.black
       image: DecorationImage(
         image: AssetImage("/home/prakash/Quiz_application_1/flutter_application_1/lib/component/util/logo.jpeg"),
       )
     ),
   );
  }
}