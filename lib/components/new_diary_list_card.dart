import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelog/auth_controller.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/screens/new_page.dart';
import 'package:travelog/ui/size_styling.dart';
import 'package:travelog/ui/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class NewDiaryListCard extends GetWidget<AuthController> {
  NewDiaryListCard({this.diary});
  final Diary diary;

  @override
  Widget build(BuildContext context) {
    final bool public = diary.getVisibility();
    final String title = diary.title;
    final Image banner = diary.getBanner();

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

    Widget numberOfPages = Tooltip(
      message: "${0.toString()} Páginas",
      child: Container(
        child: Row(
          children: [
            Text(
              0.toString(),
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

    return GestureDetector(
      onTap: () {
        Get.to(NewPageScreen(
          diaryId: diary.diaryId,
          uid: controller.user.uid,
        ));
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
  }
}
