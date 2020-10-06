import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/components/show_page_map.dart';
import 'package:travelog/constants.dart';

class ReadingDiaryPageScreen extends StatelessWidget {
  const ReadingDiaryPageScreen({Key key, this.page, this.diary, this.pageIndex})
      : super(key: key);

  final DiaryPage page;
  final Diary diary;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String date = page.getDateString();
    String indexP =
        ((pageIndex + 1).toString() + "/" + diary.pages.length.toString());
    List<String> locationsNames = page.getLocationsNames();

    void handleNextPage() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ReadingDiaryPageScreen(
          diary: diary,
          page: diary.pages[pageIndex + 1],
          pageIndex: pageIndex + 1,
        );
      }));
    }

    Widget renderLocationsNames() {
      return new Container(
        margin: EdgeInsets.only(top: 40),
        alignment: Alignment.center,
        child: new Column(
          children: locationsNames
              .map((item) => new Text(
                    item,
                    style: GoogleFonts.lobster(
                      fontSize: 40,
                      color: secondaryColor,
                    ),
                  ))
              .toList(),
        ),
      );
    }

    Widget renderMap = Container(
      child: SizedBox(
        height: size.height * 0.5,
        child: ShowPageMap(
          page: page,
        ),
      ),
    );

    Widget renderDate = Container(
      margin: EdgeInsets.only(top: 50),
      alignment: Alignment.center,
      child: Text(
        date,
        style: GoogleFonts.lobster(
          fontSize: 30,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          indexP,
          style: GoogleFonts.sansita(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 35,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            onTap: handleNextPage,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            renderMap,
            renderLocationsNames(),
            renderDate,
          ],
        ),
      ),
    );
  }
}
