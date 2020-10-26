import 'package:flutter/material.dart';
import 'package:travelog/classes/diary.dart';
import 'package:travelog/classes/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelog/classes/diary_map.dart';

class ShowDiaryMap extends StatefulWidget {
  ShowDiaryMap({Key key, this.diary}) : super(key: key);
  final Diary diary;

  @override
  _ShowDiaryMapState createState() => _ShowDiaryMapState();
}

class _ShowDiaryMapState extends State<ShowDiaryMap> {
  GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();
  Location initialLocation;
  @override
  Widget build(BuildContext context) {
    DiaryMap dMap = new DiaryMap(
      diary: widget.diary,
    );
    initialLocation = dMap.getInitialLocation();
    double lat = initialLocation.getLat();
    double lng = initialLocation.getLng();

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;

      setState(() {
        dMap.setMarkers(widget.diary.getAllLocations(), markers);
      });
    }

    return GoogleMap(
      onMapCreated: _onMapCreated,
      zoomControlsEnabled: false,
      mapType: MapType.terrain,
      initialCameraPosition: CameraPosition(
        target: LatLng(
          lat,
          lng,
        ),
        zoom: 6.5,
      ),
      markers: markers,
    );
  }
}
