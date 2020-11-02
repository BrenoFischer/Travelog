import 'package:flutter/material.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/classes/date.dart';
import 'package:travelog/ui/constants.dart';
import 'package:travelog/factories/date_factory.dart';
import 'package:travelog/factories/diary_factory.dart';
import 'package:travelog/factories/page_factory.dart';
import 'package:travelog/components/render_diaries_list_cards.dart';
import 'package:travelog/components/my_app_bar.dart';

class MyDiariesScreen extends StatefulWidget {
  @override
  _MyDiariesScreenState createState() => _MyDiariesScreenState();
}

class _MyDiariesScreenState extends State<MyDiariesScreen> {
  List<Diary> _diaries = new List();
  List<DiaryPage> _pages = new List();
  List<Date> _dates = new List();
  final String emptyMessage =
      "Ainda não há registros de viagem, comece escrevendo um agora mesmo!";

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
      appBar: MyAppBar(
        title: "Meus diários",
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: RenderDiariesListCards(
        diaries: _diaries,
        emptyMessage: emptyMessage,
        explore: false,
      ),
    );
  }
}
