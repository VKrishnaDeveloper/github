import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:my_hub_user/core/color/app_colors.dart';
import 'package:my_hub_user/core/model/autocomplate_prediction.dart';
import 'package:my_hub_user/core/model/place_auto_complate_response.dart';
import 'package:my_hub_user/core/utils/location_list_tile.dart';
import 'package:my_hub_user/core/utils/network_utility.dart';
import '../../core/constnats/constants.dart';
import 'dart:ui' as ui;

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController? _googleMapController;
  Completer<GoogleMapController>? controller1;
  static LatLng? _initialPosition;
  final Set<Marker> _markers = {};
  static LatLng _lastMapPosition = _initialPosition!;

  @override
  void dispose() {
    _googleMapController!.dispose();
    super.dispose();
  }

  final Location _locationController = Location();
  LatLng? currentPosition = null;

  Map<PolylineId, Polyline> polylines = {};
  List<AutocompletePrediction> placePredictions = [];
  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  void initState() {
    super.initState();

    getLocationUpdates().then((value) => _getUserLocation());

    // .then((_) => {
    //       getPolylinePoints()
    //           .then((coordinates)

    //            => {generatePolyLineFromPoints(coordinates)})
    //     });
    // _cameraToPosition(currentPosition!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(""),
      ),
      body: SafeArea(
          child: _initialPosition == null
              ? Container(
                  child: Center(
                    child: Text(
                      'loading map..',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                )
              : Stack(
                  children: [
                    GoogleMap(
                      markers: _markers,
                      mapType: _currentMapType,
                      initialCameraPosition: CameraPosition(
                        target: _initialPosition!,
                        zoom: 14.4746,
                      ),
                      // onMapCreated: _onMapCreated,
                      zoomGesturesEnabled: true,
                      // onCameraMove: _onCameraMove,
                      myLocationEnabled: true,
                      compassEnabled: true,
                      myLocationButtonEnabled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(40),
                              color: Colors.white),
                          height: 50,
                          width: double.infinity,
                          child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  showBottomDialog();
                                });
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Search your location",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w500,
                                        ), //Textstyle
                                      ),
                                    ],
                                  ),
                                ),
                              ))),
                    ),
                  ],
                )),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }
    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void _getUserLocation() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/logo.png', 150);
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    Position position = await Geolocator.getCurrentPosition();

    // List<Placemark> placemark = await Geolocator()
    //     .placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      // print('${placemark[0].name}');

      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _initialPosition!,
          infoWindow: InfoWindow(
              title: "My Hub",
              snippet: "This is a my hub service location",
              onTap: () {}),
          onTap: () {},
          icon: BitmapDescriptor.fromBytes(markerIcon)));
    });
  }

  // Future<List<LatLng>> getPolylinePoints() async {
  //   List<LatLng> polylineCoordinates = [];
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //       GOOGLE_MAPS_API_KEY,
  //       PointLatLng(currentPosition!.latitude, currentPosition!.longitude),
  //       PointLatLng(disGoogle.latitude, disGoogle.longitude),
  //       travelMode: TravelMode.driving);

  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   } else {
  //     // print(result.errorMessage);
  //   }
  //   return polylineCoordinates;
  // }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates,
        width: 8);
    setState(() {
      polylines[id] = polyline;
    });
  }

  void showBottomDialog() {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: _buildDialogContent(),
        );
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }

  Widget _buildDialogContent() {
    List<AutocompletePrediction> placePredictions = [];

    void placeAutoComplete(String query) async {
      Uri uri = Uri.https(
          "maps.googleapis.com",
          'maps/api/place/autocomplete/json',
          {"input": query, "key": GOOGLE_MAPS_API_KEY});

      String? response = await NetworkUtility.fetchUrl(uri);

      if (response != null) {
        PlaceAutocompleteResponse result =
            PlaceAutocompleteResponse.parseAutocompleteResult(response);

        if (result.predictions != null) {
          setState(() {
            placePredictions = result.predictions!;
          });
        }

        // PlaceAutoComple
        // print(response);
      }
    }

    return IntrinsicHeight(child:
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return Container(
        height: 650,
        width: double.maxFinite,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Material(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(70),
                      color: Colors.white),
                  height: 50,
                  width: double.infinity,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        placeAutoComplete(value.toString());
                      });
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: "Search your location",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: SvgPicture.asset(
                          "assets/images/location_pin.svg",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                  child: ListView.builder(
                      itemCount: placePredictions.length,
                      itemBuilder: (context, index) => LocationListTile(
                          location: placePredictions[index].description!,
                          press: () {
                            setState(() {
                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              //     content: Text(
                              //         "${placePredictions[index].description!} " +
                              //             "${placePredictions[index].placeId}")));
                            });

//  LatLng(currentLocation.latitude!, currentLocation.longitude!)
                          })))
            ],
          ),
        ),
      );
    }));
  }
}
