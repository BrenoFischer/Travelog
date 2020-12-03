import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiaryPagePaint extends StatelessWidget {
  DiaryPagePaint({this.w, this.h});
  final double w;
  final double h;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(
            color: Colors.black,
            width: 1,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
    );
  }
}
