import 'package:flutter/material.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/components/new_diary_list_card.dart';

class RenderDiariesListCardsNew extends StatelessWidget {
  const RenderDiariesListCardsNew({Key key, this.diaries}) : super(key: key);

  final List<Diary> diaries;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: diaries.length,
        itemBuilder: (_, index) {
          return NewDiaryListCard(
            diary: diaries[index],
          );
        });
  }
}
