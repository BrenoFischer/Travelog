import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelog/ui/constants.dart';
import 'package:travelog/classes/diary.dart';

class RenderDiariesListCards extends StatelessWidget {
  const RenderDiariesListCards({
    Key key,
    this.diaries,
    this.emptyMessage,
    this.explore,
  }) : super(key: key);
  final List<Diary> diaries;
  final String emptyMessage;
  final bool explore;

  @override
  Widget build(BuildContext context) {
    List<Diary> _diaries = new List();

    List<Diary> findPublicDiaries() {
      int i = 0;
      List<Diary> d = new List();
      for (; i < diaries.length; i++) {
        if (diaries[i].getVisibility()) {
          d.add(diaries[i]);
        }
      }
      return d;
    }

    _diaries = explore ? findPublicDiaries() : diaries;

    return _diaries.length == 0
        ? Center(
            child: Container(
              padding: EdgeInsets.all(50),
              child: Text(
                emptyMessage,
                style: GoogleFonts.sansita(fontSize: 23, color: secondaryColor),
              ),
            ),
          )
        : ListView.builder(
            itemCount: _diaries.length,
            itemBuilder: (BuildContext ctxt, int index) {
              Diary diary = _diaries[index];
              return diary.renderDiaryListCard(explore);
            },
          );
  }
}
