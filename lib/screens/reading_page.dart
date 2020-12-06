import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/screens/reading_diary_first.dart';
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
    String pageTitle = page.getTitle();

    void handleNextPage() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ReadingDiaryPageScreen(
          diary: diary,
          page: diary.pages[pageIndex + 1],
          pageIndex: pageIndex + 1,
        );
      }));
    }

    void handlePreviousPage() {
      pageIndex == 0
          ? Get.to(ReadingDiaryFirstScreen(
              diary: diary,
            ))
          : Get.to(ReadingDiaryPageScreen(
              diary: diary,
              page: diary.pages[pageIndex - 1],
              pageIndex: pageIndex - 1,
            ));
    }

    void handleGoToLastPage() {
      int i = diary.pages.length - 1;
      //Get.to(ReadingDiaryPageScreen(
      //diary: diary,
      //page: diary.pages[i],
      //pageIndex: i,
      //));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReadingDiaryPageScreen(
            diary: diary,
            page: diary.pages[i],
            pageIndex: i,
          ),
        ),
      );
    }

    void handleGoToFirstPage() {
      Get.to(ReadingDiaryPageScreen(
        diary: diary,
        page: diary.pages[0],
        pageIndex: 0,
      ));
    }

    Widget renderNextPageIcon() {
      if (pageIndex + 1 == totalPages) {
        return const SizedBox(width: 42);
      }
      return GestureDetector(
        onTap: handleNextPage,
        child: Container(
          margin: EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 35,
          ),
        ),
      );
    }

    Widget renderGoToLastPageIcon() {
      if (pageIndex + 1 == totalPages) {
        return const SizedBox(width: 42);
      }
      return Container(
        margin: EdgeInsets.only(right: 10),
        child: GestureDetector(
          child: Icon(
            Icons.fast_forward_outlined,
            color: Colors.white,
            size: 35,
          ),
          onTap: () {
            handleGoToLastPage();
          },
        ),
      );
    }

    Widget renderPreviousPageIcon() {
      return Container(
        margin: EdgeInsets.only(left: 10),
        child: GestureDetector(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 35,
          ),
          onTap: () {
            handlePreviousPage();
          },
        ),
      );
    }

    Widget renderGoToFirstPageIcon() {
      if (pageIndex == 0) {
        return const SizedBox(width: 42);
      }
      return Container(
        margin: EdgeInsets.only(left: 10),
        child: GestureDetector(
          child: Icon(
            Icons.fast_rewind_outlined,
            color: Colors.white,
            size: 35,
          ),
          onTap: () {
            handleGoToFirstPage();
          },
        ),
      );
    }

    Widget renderPageTitle() {
      return new Container(
        margin: EdgeInsets.only(top: 40),
        alignment: Alignment.center,
        child: new Text(
          pageTitle,
          style: GoogleFonts.lobster(
            fontSize: 60,
            color: primaryColor,
          ),
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
        titleSpacing: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            renderGoToFirstPageIcon(),
            renderPreviousPageIcon(),
            Expanded(
              child: Center(
                child: Text(
                  indexP,
                  style: GoogleFonts.sansita(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          renderNextPageIcon(),
          renderGoToLastPageIcon(),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            renderMap,
            renderPageTitle(),
            renderLocationsNames(),
            renderDate,
            renderText,
          ],
        ),
      ),
    );
  }
}
