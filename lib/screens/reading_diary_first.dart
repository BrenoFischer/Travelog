import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelog/classes/diary.dart';

class ReadingDiaryFirstScreen extends StatelessWidget {
  const ReadingDiaryFirstScreen({Key key, this.diary}) : super(key: key);
  final Diary diary;

  @override
  Widget build(BuildContext context) {
    final String title = diary.formatDiaryFirstPageTitle();
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
