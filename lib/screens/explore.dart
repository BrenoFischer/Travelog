import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelog/components/my_app_bar.dart';
//import 'package:travelog/classes/diary.dart';
//import 'package:travelog/classes/date.dart';
//import 'package:travelog/classes/page.dart';
import 'package:travelog/explore_controller.dart';
//import 'package:travelog/factories/date_factory.dart';
//import 'package:travelog/factories/page_factory.dart';
//import 'package:travelog/factories/diary_factory.dart';
import 'package:travelog/screens/render_diaries_list_new.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  //List<Diary> _diaries = new List();
  //List<DiaryPage> _pages = new List();
  //List<Date> _dates = new List();
  final String emptyMessage =
      "Não foram encontrados diários, procure mais tarde ou escrava um agora mesmo!";

  //@override
  //void initState() {
  //_dates = DateFactory.createDates();
  //PageFactory pFactory = new PageFactory(
  //dates: _dates,
  //);
  //_pages = pFactory.createPages();
  //DiaryFactory dFactory = new DiaryFactory(
  //pages: _pages,
  //);
  //_diaries = dFactory.createDiaries();
  //super.initState();
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Explorar Diários"),
      body: GetX<ExploreController>(
        init: Get.put<ExploreController>(ExploreController()),
        builder: (ExploreController exploreController) {
          if (exploreController != null &&
              exploreController.exploreDiaries != null) {
            return RenderDiariesListCardsNew(
              diaries: exploreController.exploreDiaries,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
