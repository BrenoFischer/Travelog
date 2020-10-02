import 'package:flutter/material.dart';
import 'package:travelog/constants.dart';
import 'package:travelog/screens/my_diaries.dart';
import 'package:travelog/screens/downloads.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        children: [
          MyDiariesScreen(),
          ExploreScreen(),
          DownloadsScreen(),
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
                  Icons.filter_hdr,
                  size: iconSize,
                ),
                title: Text("Diários"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore,
                  size: iconSize,
                ),
                title: Text("Explorar"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.file_download,
                  size: iconSize,
                ),
                title: Text("Downloads"),
              ),
            ],
          );
        },
      ),
    );
  }
}
