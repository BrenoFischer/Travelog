import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/ui/constants.dart';

class ReadingDiaryPageScreen extends StatelessWidget {
  const ReadingDiaryPageScreen({Key key, this.page, this.diary, this.pageIndex})
      : super(key: key);

  final DiaryPage page;
  final Diary diary;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int totalPages = diary.pages.length;
    String date = page.getDateString();
    String indexP = ((pageIndex + 1).toString() + "/" + totalPages.toString());
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

    Widget renderNextPageIcon() {
      if (pageIndex + 1 == totalPages) {
        return Container();
      }
      return GestureDetector(
        onTap: handleNextPage,
        child: Container(
          margin: EdgeInsets.only(right: 25.0),
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 35,
          ),
        ),
      );
    }

    Widget renderPreviousPageIcon() {
      return Container(
        margin: EdgeInsets.only(left: 25.0),
        child: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 35,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      );
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
        child: page.showPageMap(),
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

    Widget renderText = Container(
      margin: EdgeInsets.fromLTRB(25, 50, 25, 20),
      child: Text(
        page.text,
        style: GoogleFonts.sansita(
          fontSize: 20,
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
        leading: renderPreviousPageIcon(),
        actions: [
          renderNextPageIcon(),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            renderMap,
            renderLocationsNames(),
            renderDate,
            renderText,
          ],
        ),
      ),
    );
  }
}
