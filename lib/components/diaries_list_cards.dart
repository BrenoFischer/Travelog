import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/diary.dart';
import '../constants.dart';
import 'package:travelog/screens/reading_diary_first.dart';

class DiariesListCard extends StatelessWidget {
  const DiariesListCard(
      {Key key, this.title, this.banner, this.diary, this.explore})
      : super(key: key);
  final String title;
  final Image banner;
  final Diary diary;
  final bool explore;

  @override
  Widget build(BuildContext context) {
    final bool public = diary.getVisibility();

    Tooltip visibilityIcon() {
      return public
          ? Tooltip(
              message: "O diário é público",
              child: new Icon(
                Icons.remove_red_eye,
                color: secondaryColor,
              ),
            )
          : Tooltip(
              message: "O diário não é público",
              child: new Icon(
                Icons.lock,
                color: secondaryColor,
              ),
            );
    }

    Widget titleSection = Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        title,
        style: GoogleFonts.caveat(
          color: secondaryColor,
          fontSize: 40,
          fontWeight: FontWeight.bold,
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
          height: 280,
          child: banner,
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
        margin: EdgeInsets.only(top: 40, left: 15, right: 15),
        child: Card(
          elevation: 10,
          color: Colors.white,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Column(
                children: [
                  imageSection,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      titleSection,
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 25, right: 25),
                child: explore ? null : visibilityIcon(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
