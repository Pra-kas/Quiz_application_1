import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/view/Leaderboard.dart';
import 'package:flutter_application_1/component/view/homeScreen.dart';
import 'package:flutter_application_1/component/view/user_profile.dart';
import 'package:flutter_application_1/data/repository/UserDetails.dart';
import 'package:flutter_application_1/service/GetProfile.dart';
import 'package:flutter_application_1/service/getLeaderboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) async {
            if (index == 2) {
              bool res = await fetchProfile(User.name);
              if (res) {
                setState(() {
                  _currentIndex = index;
                });
              }
            } 
            if(index == 1){
              await getLeaderProfile();
              setState(() {
                _currentIndex = index;
              });
            }
            else {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.scoreboard),
              label: "Leaderboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts),
              label: "Profile",
            ),
          ],
        ),
      );
  }

  Widget _buildBody(){
    switch (_currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const Leaderboard();
      case 2:
        return const ProfileScreen();
      default:
        return Container();
    }
  }
}
