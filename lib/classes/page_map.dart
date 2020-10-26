import 'package:travelog/classes/page.dart';
import 'package:travelog/classes/location.dart';
import 'package:travelog/classes/map.dart';

class PageMap extends MyMap {
  PageMap({this.page});
  final DiaryPage page;

  Location getInitialLocation() {
    List<Location> locations = List<Location>();
    locations = page.getLocations();
    return locations[0];
  }
}
