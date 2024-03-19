import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repository/UserDetails.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height/30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              Padding(
                padding:  EdgeInsets.only(top: height/20),
                child: const Text(
                  "Leaderboard",
                  style: TextStyle(
                    
                  ),
                ),
              ),
              
              scoreBoard(height, width, User.topscore[0]["username"].toString(), User.topscore[0]["totalpoints"].toString()),
              scoreBoard(height, width, User.topscore[1]["username"].toString(), User.topscore[1]["totalpoints"].toString()),
              scoreBoard(height, width, User.topscore[2]["username"].toString(), User.topscore[2]["totalpoints"].toString()),
              scoreBoard(height, width, User.topscore[3]["username"].toString(), User.topscore[3]["totalpoints"].toString()),
              scoreBoard(height, width, User.topscore[4]["username"].toString(), User.topscore[4]["totalpoints"].toString()),

            ],
          ),
        ),
      ),
    );
  }

  Padding scoreBoard(double height, double width,String name,String points) {
    print("Prakash");
    return Padding(
     padding: EdgeInsets.only(top: height/20),
     child: SizedBox(
       width: width,
       height: height/6,
       child:  Card(
        color: const Color.fromARGB(255, 241, 237, 237),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(name),
            Text(points),
          ],
        ),
       ),
     ),
   );
  }
}