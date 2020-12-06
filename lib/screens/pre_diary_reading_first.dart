import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelog/classes/my_user.dart';
import 'package:travelog/controllers/auth_controller.dart';
import 'package:travelog/classes/date.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/location.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/components/my_app_bar.dart';
import 'package:travelog/components/progress_indicator.dart';
import 'package:travelog/components/round_button.dart';
import 'package:travelog/screens/new_page.dart';
import 'package:travelog/screens/reading_diary_first.dart';
import 'package:travelog/screens/welcome.dart';
import 'package:travelog/services/database.dart';
import 'package:travelog/ui/constants.dart';
import 'package:travelog/ui/diary_page_paint.dart';
import 'package:travelog/ui/size_styling.dart';

class PreReadingDiaryFirstScreen extends StatefulWidget {
  PreReadingDiaryFirstScreen({this.diary, this.uid});
  final Diary diary;
  final String uid;

  @override
  _TesteState createState() => _TesteState();
}

class _TesteState extends State<PreReadingDiaryFirstScreen> {
  List<DiaryPage> _pages = new List();
  Future<List<DiaryPage>> _futurePages;

  @override
  void initState() {
    _futurePages = Database().getPages(widget.uid, widget.diary.diaryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
            future: _futurePages,
            builder: (BuildContext context,
                AsyncSnapshot<List<DiaryPage>> pagesSnapshot) {
              if (pagesSnapshot.hasData) {
                List<Future<List<Location>>> _futureMarkers = List();
                _pages = pagesSnapshot.data;
                _pages.forEach((page) {
                  _futureMarkers.add(Database().getMarkers(
                      widget.uid, widget.diary.diaryId, page.pageId));
                });
                return FutureBuilder(
                    future: Future.wait(_futureMarkers),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<List<Location>>> markers) {
                      if (markers.hasData) {
                        _pages.forEach((p) {
                          String dinit = p.dateInit;
                          String dend = p.dateEnd;
                          int dayInit = int.parse(dinit.substring(0, 2));
                          int dayEnd = int.parse(dend.substring(0, 2));
                          int monInit = int.parse(dinit.substring(3, 5));
                          int monEnd = int.parse(dend.substring(3, 5));
                          int yearInit = int.parse(dinit.substring(6, 10));
                          int yearEnd = int.parse(dend.substring(6, 10));
                          Date d = Date(
                            initialDay: dayInit,
                            initialMonth: monInit,
                            initialYear: yearInit,
                            finalDay: dayEnd,
                            finalMonth: monEnd,
                            finalYear: yearEnd,
                          );
                          p.setDate(d);
                          List<Location> locations = new List();
                          markers.data.forEach((element) {
                            element.forEach((element2) {
                              String id = element2.pageId;
                              if (id == p.pageId) {
                                locations.add(element2);
                              }
                            });
                          });
                          p.setLocation(locations);
                        });
                        widget.diary.setPages(_pages);
                        Future<MyUser> futureUser =
                            Database().getUser(widget.uid);

                        return FutureBuilder(
                          future: futureUser,
                          builder: (BuildContext context,
                              AsyncSnapshot<MyUser> user) {
                            if (user.hasData) {
                              return PreDiaryLayout(
                                diary: widget.diary,
                                user: user.data,
                              );
                            } else {
                              return Center(
                                child: MyCircularProgressIndicator(),
                              );
                            }
                          },
                        );
                      } else {
                        return Center(
                          child: MyCircularProgressIndicator(),
                        );
                      }
                    });
              } else {
                return Container(
                  child: Center(
                    child: MyCircularProgressIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }
}

class PreDiaryLayout extends GetWidget<AuthController> {
  PreDiaryLayout({this.diary, this.user});
  final Diary diary;
  final MyUser user;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Widget renderNewPageButton() {
      return controller.user.uid == diary.userId
          ? Container(
              margin: EdgeInsets.only(top: AppStyles.mediumPadding),
              child: RoundButton(
                text: "Escrever nova página",
                style: false,
                fontSize: 20,
                width: MediaQuery.of(context).size.width * 0.7,
                onPress: () {
                  Get.to(
                    NewPageScreen(
                        diaryId: diary.diaryId, uid: controller.user.uid),
                  );
                },
              ),
            )
          : Container();
    }

    Widget renderOpenDiaryButton() {
      return diary.pages.length == 0
          ? Container()
          : RoundButton(
              text: "Abrir diário",
              width: MediaQuery.of(context).size.width * 0.7,
              fontSize: 20,
              style: true,
              onPress: () {
                Get.to(ReadingDiaryFirstScreen(diary: diary));
              });
    }

    return Stack(
      children: [
        Container(
          color: diaryColor,
          width: w,
          height: h - 10,
        ),
        DiaryPagePaint(w: w - 10, h: h - 12),
        DiaryPagePaint(w: w - 17, h: h - 14),
        DiaryPagePaint(w: w - 24, h: h - 16),
        DiaryPagePaint(w: w - 31, h: h - 18),
        DiaryPagePaint(w: w - 38, h: h - 20),
        Container(
          width: w - 45,
          height: h - 22,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/case.jpg'),
              fit: BoxFit.fill,
            ),
            border: Border(
              right: BorderSide(
                color: Colors.black,
                width: 1,
              ),
              bottom: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return WelcomeScreen();
                      }),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 250,
                child: Text(
                  diary.title,
                  style: AppStyles.bigTitleStyle,
                ),
              ),
              Positioned(
                left: 20,
                top: 310,
                child: Text(
                  "Por " + user.name,
                  style: AppStyles.subtitle,
                ),
              ),
              Positioned(
                left: 30,
                top: h - 230,
                child: renderNewPageButton(),
              ),
              Positioned(
                left: 30,
                top: h - 100,
                child: renderOpenDiaryButton(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
