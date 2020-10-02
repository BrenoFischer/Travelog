import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/constants.dart';
import 'package:travelog/components/my_app_bar.dart';
import 'package:travelog/screens/reading_diary_first.dart';

class MyDiariesScreen extends StatefulWidget {
  @override
  _MyDiariesScreenState createState() => _MyDiariesScreenState();
}

class _MyDiariesScreenState extends State<MyDiariesScreen> {
  List<Diary> _diaries = new List(3);

  @override
  void initState() {
    _diaries[0] = new Diary(
        public: true,
        title: "Irlanda",
        banner: Image.asset(
          'assets/images/irlandaBanner.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ));
    _diaries[1] = new Diary(
        public: false,
        title: "América do Sul",
        banner: Image.asset(
          'assets/images/americaSulBanner.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ));
    _diaries[2] = new Diary(
        public: true,
        title: "Foz do Iguaçú",
        banner: Image.asset(
          'assets/images/fozBanner.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Meus Diários"),
      body: ListView.builder(
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
