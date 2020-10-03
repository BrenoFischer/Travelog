import 'package:flutter/material.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/classes/diary.dart';

class DiaryFactory extends StatelessWidget {
  const DiaryFactory({Key key, this.pages}) : super(key: key);
  final List<DiaryPage> pages;

  List<Diary> createDiaries() {
    List<Diary> diaries = new List();

    diaries.add(
      Diary(
        public: true,
        title: "Irlanda",
        banner: Image.asset(
          'assets/images/irlandaBanner.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        pages: pages,
      ),
    );
    diaries.add(
      Diary(
          public: false,
          title: "América do Sul",
          banner: Image.asset(
            'assets/images/americaSulBanner.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          pages: pages),
    );
    diaries.add(
      Diary(
          public: false,
          title: "Foz do Iguaçú",
          banner: Image.asset(
            'assets/images/fozBanner.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          pages: pages),
    );

    return diaries;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
