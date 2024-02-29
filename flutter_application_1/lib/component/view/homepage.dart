import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/view/homeScreen.dart';
import 'package:flutter_application_1/component/view/user_profile.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
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
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return LeaderboardScreen();
      case 2:
        return const ProfileScreen();
      default:
        return Container(); // Handle the default case or return an empty container
    }
  }
}


class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Leaderboard Screen'),
    );
  }
}
