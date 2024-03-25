import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {

  Location _locationController =Location();
  static const LatLng _pGooglePlex =LatLng(37.4223, -122.0848);
  static const LatLng _pAppMrker =LatLng(37.3346, -122.0090);
  LatLng? _currentP =null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationUpdates();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      _currentP ==null ?
      const Center(child:Text("Loading.....") ,):
      GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _pGooglePlex,
          zoom: 13,
        ),
        markers: {
          Marker(markerId: MarkerId("_currantLocation"),
          icon: BitmapDescriptor.defaultMarker,
            position: _currentP!
          ),
          // Marker(markerId: MarkerId("_sourceLocation"),
          //     icon: BitmapDescriptor.defaultMarker,
          //     position: _pGooglePlex
          // ),
          // Marker(markerId: MarkerId("_destinationLocation"),
          //     icon: BitmapDescriptor.defaultMarker,
          //     position: _pAppMrker
          // ),
        },
      ),
    );
  }
  Future<void> getLocationUpdates()async{
    bool _serviceEnable;
    PermissionStatus _permissionGranted;
    _serviceEnable =await _locationController.serviceEnabled();
    if(_serviceEnable){
      _serviceEnable =await _locationController.requestService();
    }else{
      return;
    }
    _permissionGranted =await _locationController.hasPermission();
    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted=await _locationController.requestPermission();
      if(_permissionGranted != PermissionStatus.granted){
        return;
      }
    }
    _locationController.onLocationChanged.listen((LocationData currantLocation) {
      if(currantLocation.latitude != null && currantLocation.longitude !=null){
        setState(() {
          _currentP =LatLng(currantLocation.latitude!,currantLocation.longitude!);
          print(_currentP);
        });
      }
    });
  }
}
