import 'package:flutter/material.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/constants.dart';

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
        title: "America do Sul",
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
      appBar: AppBar(
        centerTitle: true,
        title: Text("Meus Diários"),
      ),
      body: ListView.builder(
          itemCount: _diaries.length,
          itemBuilder: (BuildContext ctxt, int index) {
            Diary diary = _diaries[index];
            bool public = diary.getVisibility();
            String title = diary.getTitle();
            Image banner = diary.getBanner();
            return new DiaryCard(public: public, title: title, banner: banner);
          }),
    );
  }
}

class DiaryCard extends StatelessWidget {
  const DiaryCard({Key key, this.public, this.title, this.banner})
      : super(key: key);
  final bool public;
  final String title;
  final Image banner;

  Icon visibilityIcon() {
    return public
        ? Icon(
            Icons.remove_red_eye,
            color: Colors.white,
          )
        : Icon(Icons.lock, color: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Card(
        elevation: 5,
        color: secondaryColor,
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              SizedBox(height: 200, child: banner),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  ),
                  visibilityIcon(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
