import 'package:flutter/material.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/components/diary_list_card.dart';

class RenderDiariesListCards extends StatelessWidget {
  RenderDiariesListCards({this.diaries, this.explore});
  final bool explore;
  final List<Diary> diaries;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: diaries.length,
        itemBuilder: (_, index) {
          return DiaryListCard(
            explore: explore,
            diary: diaries[index],
            uid: diaries[index].userId,
          );
        });
  }
}
