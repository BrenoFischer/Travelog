import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelog/constants.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/components/diaries_list_cards.dart';

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
    return diaries.length == 0
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
            itemCount: diaries.length,
            itemBuilder: (BuildContext ctxt, int index) {
              Diary diary = diaries[index];
              String title = diary.getTitle();
              Image banner = diary.getBanner();
              if (explore && !diary.getVisibility()) {
              } else {
                return new DiariesListCard(
                  title: title,
                  banner: banner,
                  diary: diary,
                  explore: explore,
                );
              }
            },
          );
  }
}
