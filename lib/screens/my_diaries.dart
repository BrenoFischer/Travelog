import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/classes/date.dart';
import 'package:travelog/constants.dart';
import 'package:travelog/components/my_app_bar.dart';
import 'package:travelog/screens/reading_diary_first.dart';
import 'package:travelog/factories/date_factory.dart';
import 'package:travelog/factories/diary_factory.dart';
import 'package:travelog/factories/page_factory.dart';

class MyDiariesScreen extends StatefulWidget {
  @override
  _MyDiariesScreenState createState() => _MyDiariesScreenState();
}

class _MyDiariesScreenState extends State<MyDiariesScreen> {
  List<Diary> _diaries = new List();
  List<DiaryPage> _pages = new List();
  List<Date> _dates = new List();

  @override
  void initState() {
    _dates = DateFactory.createDates();
    PageFactory pFactory = new PageFactory(
      dates: _dates,
    );
    _pages = pFactory.createPages();
    DiaryFactory dFactory = new DiaryFactory(
      pages: _pages,
    );
    _diaries = dFactory.createDiaries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Meus Diários"),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: _diaries.length == 0
          ? Center(
              child: Container(
                padding: EdgeInsets.all(50),
                child: Text(
                  "Ainda não há registros de viagem, comece escrevendo um agora mesmo!",
                  style:
                      GoogleFonts.sansita(fontSize: 23, color: secondaryColor),
                ),
              ),
            )
          : ListView.builder(
              itemCount: _diaries.length,
              itemBuilder: (BuildContext ctxt, int index) {
                Diary diary = _diaries[index];
                bool public = diary.getVisibility();
                String title = diary.getTitle();
                Image banner = diary.getBanner();
                return new DiaryCard(
                    public: public, title: title, banner: banner, diary: diary);
              }),
    );
  }
}

class DiaryCard extends StatelessWidget {
  const DiaryCard({Key key, this.public, this.title, this.banner, this.diary})
      : super(key: key);
  final bool public;
  final String title;
  final Image banner;
  final Diary diary;

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

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        title,
        style: GoogleFonts.indieFlower(
          color: secondaryColor,
          fontSize: 30,
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
                child: visibilityIcon(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
