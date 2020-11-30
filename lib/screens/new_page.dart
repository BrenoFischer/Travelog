import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:travelog/components/my_app_bar.dart';
import 'package:travelog/components/my_date_text_field.dart';
import 'package:travelog/components/round_button.dart';
import 'package:travelog/components/text_form_field.dart';
import 'package:travelog/screens/my_diaries.dart';
import 'package:travelog/screens/welcome.dart';
import 'package:travelog/services/database.dart';
import 'package:travelog/ui/constants.dart';
import 'package:travelog/ui/size_styling.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:travelog/credentials.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class NewPageScreen extends StatefulWidget {
  NewPageScreen({this.diaryId, this.uid});
  final String diaryId;
  final String uid;

  @override
  _NewPageScreenState createState() => _NewPageScreenState();
}

class _NewPageScreenState extends State<NewPageScreen> {
  List<Marker> markers = [];
  List<String> names = List();
  LatLng initialLocation = LatLng(40.7128, -74.0060);
  LatLng latlng;
  Completer<GoogleMapController> _mapController = Completer();
  final GlobalKey<FormState> _newPageKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _markerFormKey = GlobalKey<FormState>();
  final _controllerTitle = TextEditingController();
  final _controllerDateInit = TextEditingController();
  final _controllerDateEnd = TextEditingController();
  final _controllerText = TextEditingController();
  final _controllerName = TextEditingController();

  @override
  void initState() {
    latlng = initialLocation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy");
    Size size = MediaQuery.of(context).size;

    Future<void> moveTo(double lat, double lng) async {
      setState(() {
        latlng = LatLng(lat, lng);
      });
      final GoogleMapController controller = await _mapController.future;
      controller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(lat, lng),
            zoom: 12.00,
          ),
        ),
      );
    }

    String nameValidator(String value) {
      if (value.length < 3 || value.length > 15) {
        return "O nome do local precisa ter entre 3 e 15 caracteres";
      } else {
        return null;
      }
    }

    void _addMarkerOnCenterLocation() {
      if (_markerFormKey.currentState.validate()) {
        setState(() {
          markers.add(
            Marker(
              markerId: MarkerId(latlng.toString()),
              position: latlng,
            ),
          );
          names.add(_controllerName.text);
        });
        FocusScope.of(context).unfocus();
        _controllerName.clear();
      }
    }

    void _clearMarkers() {
      setState(() {
        markers = [];
        names = [];
      });
    }

    void _getLatLngFromPrediction(Prediction prediction) async {
      GoogleMapsPlaces _places = new GoogleMapsPlaces(apiKey: PLACES_API_KEY);
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(prediction.placeId);

      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      moveTo(lat, lng);
    }

    void _getPredictions() async {
      Prediction prediction = await PlacesAutocomplete.show(
        context: context,
        apiKey: PLACES_API_KEY,
        mode: Mode.fullscreen, // Mode.overlay
        language: "pt_BR",
      );
      if (prediction != null) {
        print(prediction.description);
        _getLatLngFromPrediction(prediction);
      }
    }

    String titleValidator(String value) {
      if (value.length < 3 || value.length > 13) {
        return "O título deve ter entre 3 e 13 caracteres";
      } else {
        return null;
      }
    }

    void handleSubmit() async {
      if (_controllerDateInit.text.length == 0 ||
          _controllerDateEnd.text.length == 0) {
        Get.snackbar(
          "Erro ao marcar datas",
          "É necessário marcar data de início e fim",
        );
        return;
      }
      if (markers.length == 0) {
        Get.snackbar(
          "Erro ao marcar locais",
          "É necessário marcar pelo menos 1 local no mapa",
        );
        return;
      }
      if (_controllerText.text.length == 0) {
        Get.snackbar(
          "Erro ao capturar texto",
          "É necessário escrever um pouco sobre suas experiências",
        );
        return;
      }
      if (_controllerTitle.text.length == 0) {
        Get.snackbar(
          "Erro ao capturar título",
          "É necessário escrever um título",
        );
        return;
      }
      await Database().createPage(
        widget.uid,
        widget.diaryId,
        _controllerTitle.text,
        _controllerText.text,
        _controllerDateInit.text,
        _controllerDateEnd.text,
        markers,
        names,
      );
      Get.to(WelcomeScreen());
    }

    return Scaffold(
      appBar: MyAppBar(
        title: "Nova página",
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _newPageKey,
          child: Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: AppStyles.smallPadding),
                  child: Text(
                    "Escolha um título",
                    style: AppStyles.fieldStyle,
                  ),
                ),
                MyTextFormField(
                  type: 'title',
                  label: 'Título',
                  size: size,
                  controller: _controllerTitle,
                  validator: titleValidator,
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: AppStyles.smallPadding,
                      bottom: AppStyles.smallPadding),
                  child: Text(
                    "Marque as datas do relato",
                    style: AppStyles.fieldStyle,
                  ),
                ),
                MyDateTextField(
                  title: "Data de início (${format.pattern})",
                  format: format,
                  controller: _controllerDateInit,
                ),
                MyDateTextField(
                  title: "Data de fim (${format.pattern})",
                  format: format,
                  controller: _controllerDateEnd,
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: AppStyles.smallPadding,
                      bottom: AppStyles.smallPadding),
                  child: Text(
                    "Marque no mapa os locais visitados",
                    style: AppStyles.fieldStyle,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _getPredictions();
                  },
                  child: SizedBox(
                    width: size.width * 0.9,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: AppStyles.smallPadding,
                        bottom: AppStyles.smallPadding - 6,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(17),
                          child: Text(
                            "Pesquisar local...",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Form(
                  key: _markerFormKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: AppStyles.smallPadding),
                        height: 400,
                        width: size.width,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            GoogleMap(
                              onCameraMove: (data) {
                                setState(() {
                                  latlng = data.target;
                                });
                              },
                              onMapCreated: (GoogleMapController controller) {
                                _mapController.complete(controller);
                              },
                              markers: Set.from(markers),
                              initialCameraPosition: CameraPosition(
                                target: initialLocation,
                                zoom: 12.0,
                              ),
                              gestureRecognizers: Set()
                                ..add(
                                  Factory<EagerGestureRecognizer>(
                                      () => EagerGestureRecognizer()),
                                ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: AppStyles.smallPadding,
                                bottom: AppStyles.smallPadding,
                              ),
                              child: Row(
                                children: [
                                  FloatingActionButton(
                                    heroTag: "btn1",
                                    onPressed: _clearMarkers,
                                    backgroundColor: secondaryColor,
                                    child: Icon(
                                      Icons.cleaning_services_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: FloatingActionButton(
                                      heroTag: "btn2",
                                      onPressed: _addMarkerOnCenterLocation,
                                      backgroundColor: primaryColor,
                                      child: Icon(
                                        Icons.add_location_alt_outlined,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: MyTextFormField(
                          controller: _controllerName,
                          size: size,
                          type: 'title',
                          label: "Nome do local",
                          validator: nameValidator,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: AppStyles.mediumPadding,
                      bottom: AppStyles.smallPadding),
                  child: Text(
                    "Escreva suas experiências vividas",
                    style: AppStyles.fieldStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 300.0,
                    ),
                    child: TextFormField(
                      maxLines: null,
                      controller: _controllerText,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: secondaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: AppStyles.mediumPadding,
                    bottom: AppStyles.mediumPadding,
                  ),
                  child: RoundButton(
                    text: "Criar Página",
                    onPress: handleSubmit,
                    style: true,
                    width: AppStyles.buttonWidth * 1.4,
                    fontSize: AppStyles.buttonText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
