import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Google Maps'),
      ),
      body: GoogleMap(
        circles: {
          Circle(
            circleId: const CircleId('test'),
            radius: 5000,
            center: _center,
            fillColor: Colors.blue.withOpacity(0.3),
            strokeColor: Colors.transparent,
          ),
          const Circle(
            circleId: CircleId('-122.677433'),
            radius: 5000,
          ),
        },
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        // cameraTargetBounds: CameraTargetBounds(
        //   LatLngBounds(
        //     southwest: _sw,
        //     northeast: _ne,
        //   ),
        // ),
       //markers: ,
        indoorViewEnabled: true,
        mapToolbarEnabled: true,
        compassEnabled: true,
        buildingsEnabled: true,
        onMapCreated: (controller) => _onMapCreated(controller),
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
