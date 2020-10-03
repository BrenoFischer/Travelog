import 'package:flutter/material.dart';
import 'package:travelog/components/my_app_bar.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/date.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/components/render_diaries_list_cards.dart';
import 'package:travelog/factories/date_factory.dart';
import 'package:travelog/factories/page_factory.dart';
import 'package:travelog/factories/diary_factory.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<Diary> _diaries = new List();
  List<DiaryPage> _pages = new List();
  List<Date> _dates = new List();
  final String emptyMessage =
      "Não foram encontrados diários, procure mais tarde ou escrava um agora mesmo!";

  @override
  void initState() {
    _dates = DateFactory.createDates();
    PageFactory pFactory = new PageFactory(
      dates: _dates,
    );
    _pages = pFactory.createPages();
    DiaryFactory dFactory = new DiaryFactory(
      pages: _pages,
    );
    _diaries = dFactory.createDiaries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Explorar Diários"),
      body: RenderDiariesListCards(
        diaries: _diaries,
        emptyMessage: emptyMessage,
        explore: true,
      ),
    );
  }
}
