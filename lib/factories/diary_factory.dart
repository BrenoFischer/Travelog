import 'package:flutter/material.dart';
import 'package:travelog/classes/image_banner.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/classes/diary.dart';

class DiaryFactory extends StatelessWidget {
  const DiaryFactory({Key key, this.pages}) : super(key: key);
  final List<DiaryPage> pages;

  List<Diary> createDiaries() {
    List<Diary> diaries = new List();
    ImageBanner irlandaBanner = new ImageBanner(
        width: 600, height: 240, url: "assets/images/irlandaBanner.jpg");
    ImageBanner americaSulBanner = new ImageBanner(
        width: 600, height: 240, url: "assets/images/americaSulBanner.jpg");
    ImageBanner fozBanner = new ImageBanner(
        width: 600, height: 240, url: "assets/images/fozBanner.jpg");

    Diary createDiary(
        String title, bool public, ImageBanner banner, List<DiaryPage> pages) {
      return new Diary(
        public: public,
        title: title,
        banner: Image.asset(
          banner.url,
          width: banner.width,
          height: banner.height,
          fit: BoxFit.cover,
        ),
        pages: pages,
      );
    }

    diaries.add(
      createDiary("Irlanda", true, irlandaBanner, pages),
    );
    diaries.add(
      createDiary("América do Sul", false, americaSulBanner, pages),
    );
    diaries.add(
      createDiary("Foz do Iguaçú", false, fozBanner, pages),
    );

    return diaries;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
