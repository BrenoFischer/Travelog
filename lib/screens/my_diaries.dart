import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelog/controllers/auth_controller.dart';
import 'package:travelog/components/progress_indicator.dart';
import 'package:travelog/controllers/diary_controller.dart';
import 'package:travelog/screens/new_diary.dart';
import 'package:travelog/ui/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/render_diaries_list.dart';
import 'package:travelog/components/my_app_bar.dart';

class MyDiariesScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    final String emptyMessage =
        "Ainda não há registros de viagem, comece escrevendo um agora mesmo!";

    Widget emptyMessageContainer = Center(
      child: Container(
        padding: EdgeInsets.all(50),
        child: Text(
          emptyMessage,
          style: GoogleFonts.sansita(fontSize: 23, color: secondaryColor),
        ),
      ),
    );

    return Scaffold(
      appBar: MyAppBar(
        title: "Meus diários",
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(NewDiaryScreen(uid: controller.user.uid));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: GetX<DiaryController>(
        init: Get.put<DiaryController>(DiaryController()),
        builder: (DiaryController diaryController) {
          if (diaryController != null && diaryController.diaries != null) {
            if (diaryController.diaries.length == 0) {
              return emptyMessageContainer;
            } else {
              diaryController.rebind();
              return RenderDiariesListCards(
                diaries: diaryController.diaries,
              );
            }
          } else {
            return Center(
              child: MyCircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
