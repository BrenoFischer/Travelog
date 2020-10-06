import 'package:flutter/material.dart';
import 'package:travelog/classes/location.dart';

abstract class LocationFactory extends StatelessWidget {
  static List<Location> createLocationPage1() {
    List<Location> locations = List();
    locations.add(
      new Location(
        lat: 53.3244431,
        lng: -6.3857881,
        name: "Dublin",
      ),
    );
    locations.add(
      new Location(
        lat: 52.9393034,
        lng: -9.3945197,
        name: "Liscannor",
      ),
    );
    return locations;
  }

  static List<Location> createLocationPage2() {
    List<Location> locations = List();
    locations.add(
      new Location(
        lat: 52.9715489,
        lng: -9.4396372,
        name: "Cliffs of moher",
      ),
    );
    locations.add(
      new Location(
        lat: 53.0170597,
        lng: -9.3864838,
        name: "Doolin",
      ),
    );
    return locations;
  }

  static List<Location> createLocationPage3() {
    List<Location> locations = List();
    locations.add(
      new Location(
        lat: 53.2839936,
        lng: -9.11878647,
        name: "Galway",
      ),
    );
    locations.add(
      new Location(
        lat: 52.9403841,
        lng: -9.3022499,
        name: "Ennistymon",
      ),
    );
    return locations;
  }
}
