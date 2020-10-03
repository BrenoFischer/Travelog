import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/date.dart';

class ReadingDiaryFirstScreen extends StatelessWidget {
  const ReadingDiaryFirstScreen({Key key, this.diary}) : super(key: key);
  final Diary diary;

  @override
  Widget build(BuildContext context) {
    final String place = diary.getTitle();
    final Date firstDate = diary.getFirstDate();
    final Date lastDate = diary.getLastDate();
    final String d1 = firstDate.getInitialDay().toString();
    final String m1 = firstDate.getInitialMonth().toString();
    final int yInt = firstDate.getInitialYear();
    final String y1 =
        yInt > 2000 ? (yInt - 2000).toString() : (yInt - 1900).toString();

    final String d2 = lastDate.getInitialDay().toString();
    final String m2 = lastDate.getInitialMonth().toString();
    final int yInt2 = lastDate.getInitialYear();
    final String y2 =
        yInt > 2000 ? (yInt2 - 2000).toString() : (yInt2 - 1900).toString();

    final String title = place +
        " - (" +
        d1 +
        "/" +
        m1 +
        "/" +
        y1 +
        " - " +
        d2 +
        "/" +
        m2 +
        "/" +
        y2 +
        ")";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: GoogleFonts.sansita(fontSize: 20),
        ),
      ),
      body: Container(),
    );
  }
}
