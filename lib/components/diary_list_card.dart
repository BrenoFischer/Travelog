import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelog/ui/size_styling.dart';
import '../classes/diary.dart';
import '../ui/constants.dart';
import 'package:travelog/screens/reading_diary_first.dart';

class DiaryListCard extends StatelessWidget {
  const DiaryListCard({Key key, this.diary, this.explore}) : super(key: key);
  final Diary diary;
  final bool explore;

  @override
  Widget build(BuildContext context) {
    final bool public = diary.getVisibility();
    final String title = diary.title;
    //final Image banner = diary.banner;

    Tooltip visibilityIcon() {
      return public
          ? Tooltip(
              message: "O diário é público",
              child: new Icon(
                Icons.remove_red_eye,
                color: secondaryColor,
                size: AppStyles.iconCardSize,
              ),
            )
          : Tooltip(
              message: "O diário não é público",
              child: new Icon(
                Icons.lock,
                color: secondaryColor,
                size: AppStyles.iconCardSize,
              ),
            );
    }

    Widget emptyContainer = Container(
      padding: EdgeInsets.all(15),
    );

    Widget numberOfPages = Tooltip(
      message: "${diary.getNumberOfPages().toString()} Páginas",
      child: Container(
        child: Row(
          children: [
            Text(
              diary.getNumberOfPages().toString(),
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
    );

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
          //child: banner,
        ),
      ),
    );
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ReadingDiaryFirstScreen(diary: diary);
            },
          ),
        );
      },
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
                        numberOfPages,
                        titleSection,
                        explore ? emptyContainer : visibilityIcon(),
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
  }
}
