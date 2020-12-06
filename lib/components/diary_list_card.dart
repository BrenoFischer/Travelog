import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/components/my_snackbar.dart';
import 'package:travelog/components/progress_indicator.dart';
import 'package:travelog/screens/new_page.dart';
import 'package:travelog/services/database.dart';
import 'package:travelog/screens/pre_diary_reading_first.dart';
import 'package:travelog/ui/size_styling.dart';
import 'package:travelog/ui/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class DiaryListCard extends StatefulWidget {
  DiaryListCard({this.diary, this.uid, this.explore});
  final bool explore;
  final Diary diary;
  final String uid;

  @override
  _DiaryListCardState createState() => _DiaryListCardState();
}

class _DiaryListCardState extends State<DiaryListCard> {
  int _numOfPages;
  Future<int> _pagesFuture;
  @override
  void initState() {
    _pagesFuture =
        Database().getNumberOfPages(widget.uid, widget.diary.diaryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool public = widget.diary.getVisibility();
    final String title = widget.diary.title;
    final Image banner = widget.diary.getBanner();

    void onTapVisibilityIcon() {
      MySnackbar.callSnackbar(
          "Visibilidade alterada",
          "A visibilidade do seu diário foi alterada. O ícone pode demorar a atualizar.",
          "bottom");
      Database()
          .changeDiaryVisibility(widget.uid, widget.diary.diaryId, !public);
    }

    Widget visibilityIcon() {
      if (widget.explore) {
        return Container();
      }
      return public
          ? GestureDetector(
              onTap: onTapVisibilityIcon,
              child: new Icon(
                Icons.remove_red_eye,
                color: secondaryColor,
                size: AppStyles.iconCardSize,
              ),
            )
          : GestureDetector(
              onTap: onTapVisibilityIcon,
              child: new Icon(
                Icons.lock,
                color: secondaryColor,
                size: AppStyles.iconCardSize,
              ),
            );
    }

    Widget titleSection = Flexible(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Tooltip(
          message: title,
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.titleStyle,
          ),
        ),
      ),
    );

    Widget imageSection = Container(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.5, color: Colors.black),
            left: BorderSide(width: 1.5, color: Colors.black),
            right: BorderSide(width: 1.5, color: Colors.black),
            bottom: BorderSide(width: 1.5, color: Colors.black),
          ),
        ),
        child: SizedBox(
          height: AppStyles.imageCardSize,
          child: banner,
        ),
      ),
    );

    Widget numberOfPagesContainer(numPages) {
      return (Tooltip(
        message: numPages + " Páginas",
        child: Container(
          child: Row(
            children: [
              Text(
                numPages,
                style: GoogleFonts.sansita(
                  fontSize: AppStyles.iconCardSize - 5,
                  color: secondaryColor,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Icon(
                  Icons.auto_stories,
                  size: AppStyles.iconCardSize,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ));
    }

    void onTapRoute() {
      if (_numOfPages == 0) {
        Get.to(
          NewPageScreen(
            diaryId: widget.diary.diaryId,
            uid: widget.uid,
          ),
        );
      } else {
        Get.to(PreReadingDiaryFirstScreen(
          uid: widget.uid,
          diary: widget.diary,
        ));
      }
    }

    return FutureBuilder(
      future: _pagesFuture,
      builder: (BuildContext context, AsyncSnapshot<int> numberOfPages) {
        if (numberOfPages.hasData) {
          return GestureDetector(
            onTap: onTapRoute,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 50),
              child: Card(
                elevation: 10,
                color: Colors.white,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Column(
                      children: [
                        imageSection,
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              numberOfPagesContainer(
                                  numberOfPages.data.toString()),
                              titleSection,
                              visibilityIcon(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            margin: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 50),
            child: Card(
              elevation: 10,
              color: Colors.white,
              child: Column(
                children: [
                  imageSection,
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: MyCircularProgressIndicator(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
