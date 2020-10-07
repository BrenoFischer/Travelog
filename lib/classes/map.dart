import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelog/classes/location.dart';

abstract class Map {
  void onMapCreated(GoogleMapController controller, List<Location> locations,
      Set<Marker> markers) {
    int k = locations.length;
    for (int i = 0; i < k; i++) {
      double lati = locations[i].getLat();
      double lngi = locations[i].getLng();
      LatLng position = LatLng(lati, lngi);
      String markerId = lati.toString() + lngi.toString() + locations[i].name;
      final Marker marker = new Marker(
        markerId: new MarkerId(markerId),
        position: position,
      );
      markers.add(marker);
    }
  }
}
