import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  GoogleMapController? _controller;
  
  // ডিফল্ট লোকেশন (যেমন: ঢাকা, বাংলাদেশ)
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(23.8103, 90.4125),
    zoom: 14.0,
  );

  final Set<Marker> _markers = {};

  // ব্যবহারকারীর বর্তমান জিপিএস লোকেশন বের করার ফাংশন
  Future<void> _getUserCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // জিপিএস সার্ভিস চালু আছে কি না চেক করা
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // লোকেশন পারমিশন চেক করা
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    // বর্তমান পজিশন নেওয়া
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    LatLng currentLatLng = LatLng(position.latitude, position.longitude);

    // ম্যাপ ক্যামেরাকে বর্তমান লোকেশনে নিয়ে যাওয়া
    _controller?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: currentLatLng,
        zoom: 16.0,
      ),
    ));

    // ম্যাপে মার্কার বা পিন যোগ করা
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('currentLocation'),
          position: currentLatLng,
          infoWindow: const InfoWindow(title: 'HasibGo - My Current Location'),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HasibGo Live Tracking'),
        backgroundColor: Colors.teal,
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        markers: _markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getUserCurrentLocation,
        child: const Icon(Icons.my_location),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
