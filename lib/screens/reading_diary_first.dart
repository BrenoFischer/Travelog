import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/components/show_diary_map.dart';
import 'package:travelog/screens/reading_page.dart';
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
                child: diary.showDiaryMap(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: RoundButton(
                  text: buttonText,
                  size: 20,
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
