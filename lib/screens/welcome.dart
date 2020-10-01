import 'package:flutter/material.dart';
import 'package:travelog/constants.dart';
import 'package:travelog/screens/diaries.dart';
import 'package:travelog/screens/downloads.dart';
import 'package:travelog/screens/explore.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final pageViewController = PageController();

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
          DiariesScreen(),
          ExploreScreen(),
          DownloadsScreen(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: pageViewController,
        builder: (context, snapshot) {
          return BottomNavigationBar(
            unselectedItemColor: Colors.grey[500],
            selectedItemColor: primaryColor,
            currentIndex: pageViewController?.page?.round() ?? 0,
            onTap: (index) {
              pageViewController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                title: Text("Diários"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                title: Text("Diários"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books),
                title: Text("Diários"),
              ),
            ],
          );
        },
      ),
    );
  }
}
