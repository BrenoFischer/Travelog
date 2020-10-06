import 'package:flutter/material.dart';
import 'package:travelog/classes/page.dart';
import 'package:travelog/classes/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelog/classes/page_map.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';

class ShowPageMap extends StatefulWidget {
  ShowPageMap({Key key, this.page}) : super(key: key);
  final DiaryPage page;

  @override
  _ShowPageMapState createState() => _ShowPageMapState();
}

class _ShowPageMapState extends State<ShowPageMap> {
  GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();
  Location initialLocation;
  @override
  Widget build(BuildContext context) {
    PageMap dMap = new PageMap(
      page: widget.page,
    );
    initialLocation = dMap.getInitialLocation();
    double lat = initialLocation.getLat();
    double lng = initialLocation.getLng();

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;

      setState(() {
        markers = dMap.getMarkers();
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
      gestureRecognizers: Set()
        ..add(Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())),
    );
  }
}
