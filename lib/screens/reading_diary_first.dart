import 'package:flutter/material.dart';
import 'package:travelog/classes/diary.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ReadingDiaryFirstScreen extends StatelessWidget {
  const ReadingDiaryFirstScreen({Key key, this.diary}) : super(key: key);
  final Diary diary;

  @override
  Widget build(BuildContext context) {
    final String title = diary.getTitle();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(37.42796133580664, -122.085749655962),
            zoom: 14.4746,
          ),
        ));
  }
}
