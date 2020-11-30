import 'package:flutter/material.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/components/my_app_bar.dart';
import 'package:travelog/components/progress_indicator.dart';
import 'package:travelog/components/render_diaries_list.dart';
import 'package:travelog/services/database.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  Future<List<String>> _futureUsersId;
  List<String> _usersId = new List();
  final String emptyMessage =
      "Não foram encontrados diários, procure mais tarde ou escrava um agora mesmo!";

  @override
  void initState() {
    _futureUsersId = Database().getUsersId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Explorar Diários"),
      body: FutureBuilder(
        future: _futureUsersId,
        builder: (BuildContext context,
            AsyncSnapshot<List<String>> usersIdSnapshot) {
          if (usersIdSnapshot.hasData) {
            List<Future<List<Diary>>> _futureDiaries = List();
            _usersId = usersIdSnapshot.data;
            _usersId.forEach((id) {
              _futureDiaries.add(Database().getDiaries(id));
            });
            return FutureBuilder(
                future: Future.wait(_futureDiaries),
                builder: (BuildContext context,
                    AsyncSnapshot<List<List<Diary>>> diaries) {
                  if (diaries.hasData) {
                    List<Diary> _allDiaries = new List();
                    diaries.data.forEach((d) {
                      d.forEach((d2) {
                        _allDiaries.add(d2);
                      });
                    });
                    return RenderDiariesListCards(
                      diaries: _allDiaries,
                    );
                  } else {
                    return Center(
                      child: MyCircularProgressIndicator(),
                    );
                  }
                });
            //return RenderDiariesListCardsNew(
            //diaries: exploreController.exploreDiaries,
            //);
          } else {
            return Center(
              child: MyCircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
