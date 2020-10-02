import 'package:flutter/material.dart';

class Diary extends StatelessWidget {
  const Diary({Key key, this.public, this.title, this.banner})
      : super(key: key);
  final bool public;
  final String title;
  //final List<Page> pages;
  final Image banner;

  bool getVisibility() {
    return public;
  }

  String getTitle() {
    return title;
  }

  Image getBanner() {
    return banner;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
