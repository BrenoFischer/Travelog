import 'package:flutter/material.dart';
import 'package:travelog/constants.dart';
import 'package:travelog/screens/my_diaries.dart';
import 'package:travelog/screens/profile.dart';
import 'package:travelog/screens/explore.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final pageViewController = PageController();
  double iconSize = 35;

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        children: [
          MyDiariesScreen(),
          ExploreScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: pageViewController,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            unselectedItemColor: Colors.grey[600],
            selectedItemColor: primaryColor,
            unselectedFontSize: 15,
            selectedFontSize: 17,
            currentIndex: pageViewController?.page?.round() ?? 0,
            onTap: (index) {
              pageViewController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.landscape,
                  size: iconSize,
                ),
                label: "Diários",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                  size: iconSize,
                ),
                label: "Explorar",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: iconSize,
                ),
                label: "Perfil",
              ),
            ],
          );
        },
      ),
    );
  }
}
