import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/location.dart';
import 'package:travelog/classes/map.dart';

class DiaryMap extends MyMap {
  DiaryMap({this.diary});
  final Diary diary;

  Location getInitialLocation() {
    List<Location> locations = List<Location>();
    locations = diary.getAllLocations();
    return locations[0];
  }
}
