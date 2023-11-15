import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:my_hub_user/core/color/app_colors.dart';
import 'dart:ui' as ui;

class MapScreen extends StatefulWidget {
  MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController>? controller1;
  static LatLng? _initialPosition;
  final Set<Marker> _markers = {};
  static LatLng _lastMapPosition = _initialPosition!;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller1?.complete(controller);
    });
  }

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
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

  _onAddMarkerButtonPressed() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/logo.png', 100);
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
              title: "My Hub",
              snippet: "This is a my hub service location",
              onTap: () {}),
          onTap: () {},
          icon: BitmapDescriptor.fromBytes(markerIcon)));
    });
  }

  void _getUserLocation() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/logo.png', 200);
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

  Widget mapButton(Function function, Icon icon, Color color) {
    return RawMaterialButton(
      onPressed: () {
        function();
      },
      child: icon,
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: color,
      padding: const EdgeInsets.all(7.0),
    );
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
                      onMapCreated: _onMapCreated,
                      zoomGesturesEnabled: true,
                      onCameraMove: _onCameraMove,
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
                                setState(() {});
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          margin:
                              const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                          child: Column(
                            children: <Widget>[
                              mapButton(
                                  _onAddMarkerButtonPressed,
                                  const Icon(
                                    Icons.add_location_alt,
                                    color: Colors.white,
                                  ),
                                  Colors.blue),
                              mapButton(
                                  _onMapTypeButtonPressed,
                                  const Icon(
                                    Icons.map_outlined,
                                    color: Colors.white,
                                  ),
                                  Colors.blue),
                            ],
                          )),
                    )
                  ],
                )),
    );
  }
}
