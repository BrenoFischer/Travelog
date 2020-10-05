import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/map.dart';
import 'package:travelog/components/round_button.dart';

class ReadingDiaryFirstScreen extends StatelessWidget {
  const ReadingDiaryFirstScreen({Key key, this.diary}) : super(key: key);
  final Diary diary;

  @override
  Widget build(BuildContext context) {
    final String title = diary.formatDiaryFirstPageTitle();
    Size size = MediaQuery.of(context).size;
    String buttonText = "Explorar diário!";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: GoogleFonts.sansita(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: size.height * 0.88,
                child: Map(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: RoundButton(
                  text: buttonText,
                  size: 20,
                  onPress: () {},
                  fontSize: 20,
                  style: true,
                  width: size.width * 0.7,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
