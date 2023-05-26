import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(36.752887, 3.042048),
    zoom: 8.4746,
  );

  List<Marker> _markers = <Marker>[];
  late double _lastLatitude;
  late double _lastLongitude;

  @override
  void initState() {
    super.initState();
    _getLastLocation();
  }

  Future<void> _getLastLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? latitude = prefs.getDouble('lastLatitude');
    double? longitude = prefs.getDouble('lastLongitude');
    if (latitude != null && longitude != null) {
      setState(() {
        _lastLatitude = latitude;
        _lastLongitude = longitude;
      });
    }
  }

  Future<void> _saveLastLocation(double latitude, double longitude) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('lastLatitude', latitude);
    await prefs.setDouble('lastLongitude', longitude);
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value) {}).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: GoogleMap(
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: _kGoogle,
            markers: Set<Marker>.of(_markers),
            mapType: MapType.satellite,
            myLocationEnabled: true,
            compassEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              if (_lastLatitude != null && _lastLongitude != null) {
                controller.moveCamera(CameraUpdate.newLatLng(LatLng(_lastLatitude, _lastLongitude)));
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xff0097b2),
        label: Text('Get location!'),
        onPressed: () async {
          getUserCurrentLocation().then((value) async {
            double latitude = value.latitude;
            double longitude = value.longitude;
            print(latitude.toString() + " " + longitude.toString());

            // Marker added for the current user's location
            _markers.add(
              Marker(
                markerId: MarkerId("2"),
                position: LatLng(latitude, longitude),
                infoWindow: InfoWindow(
                  title: 'My Current Location',
                ),
              ),
            );

            // Specify current user's location
            CameraPosition cameraPosition = CameraPosition(
              target: LatLng(latitude, longitude),
              zoom: 14,
            );

            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

            _saveLastLocation(latitude, longitude);

            setState(() {});
          });
        },
        icon: Icon(Icons.my_location),
      ),
    );
  }
}