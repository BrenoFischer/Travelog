import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelog/controllers/auth_controller.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/components/diary_list_card.dart';

class RenderDiariesListCards extends GetWidget<AuthController> {
  RenderDiariesListCards({this.diaries});

  final List<Diary> diaries;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: diaries.length,
        itemBuilder: (_, index) {
          return DiaryListCard(
            diary: diaries[index],
            uid: diaries[index].userId,
          );
        });
  }
}
