import 'package:flutter/material.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/screens/pre_diary_reading_first.dart';
import 'package:travelog/screens/reading_page.dart';
import 'package:travelog/components/round_button.dart';
import 'package:travelog/screens/welcome.dart';
import 'package:travelog/ui/constants.dart';
import 'package:travelog/ui/size_styling.dart';

class ReadingDiaryFirstScreen extends StatelessWidget {
  const ReadingDiaryFirstScreen({Key key, this.diary}) : super(key: key);
  final Diary diary;

  @override
  Widget build(BuildContext context) {
    final String title = diary.getDiaryFirstPageTitle();
    final String date = diary.formatDiaryFirstPageDate();
    Size size = MediaQuery.of(context).size;
    String buttonText = "Explorar diário!";

    Widget arrowBack = Container(
      margin: EdgeInsets.only(left: AppStyles.smallPadding),
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return PreReadingDiaryFirstScreen(
                uid: diary.userId,
                diary: diary,
              );
            }),
          );
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: AppStyles.arrowBackIcon,
          color: primaryColor,
        ),
      ),
    );

    Widget titleContainer = Column(
      children: [
        Text(
          title,
          style: AppStyles.titleStyle,
        ),
        Text(
          date,
          style: AppStyles.titleStyle,
        ),
      ],
    );

    Widget topSection = Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: EdgeInsets.only(top: AppStyles.mediumPadding),
        child: Stack(
          alignment: Alignment.center,
          children: [
            titleContainer,
            arrowBack,
          ],
        ),
      ),
    );

    Widget buttonSection = Container(
      margin: EdgeInsets.only(bottom: AppStyles.mediumPadding),
      child: RoundButton(
        text: buttonText,
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ReadingDiaryPageScreen(
                  diary: diary,
                  page: diary.pages[0],
                  pageIndex: 0,
                );
              },
            ),
          );
        },
        fontSize: AppStyles.buttonText * 1.15,
        style: true,
        width: AppStyles.buttonWidth * 1.6,
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: size.height,
                child: diary.showDiaryMap(),
              ),
              topSection,
              buttonSection,
            ],
          ),
        ],
      ),
    );
  }
}
