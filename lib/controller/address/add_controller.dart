import 'dart:async';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/AppRoots.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  Completer<GoogleMapController>? completercontroller;
  late Position postion;
  double? lat, lng;
  CameraPosition? kGooglePlex;
  List<Marker> marker = [];

  addMarker(LatLng latLng) {
    marker.clear();
    marker.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    lng = latLng.longitude;
    update();
  }

  goToAddAdressDetails() {
    Get.toNamed(AppRoots.addressaddtwo,
        arguments: {"lat": lat.toString(), "lng": lng.toString()});
  }

  getCurrentLocation() async {
    postion = await Geolocator.getCurrentPosition().then((value) => value);
    kGooglePlex = CameraPosition(
      target: LatLng(postion.latitude, postion.longitude),
      zoom: 14,
    );
    lat = postion.latitude;
    lng = postion.longitude;
    LatLng p = LatLng(postion.latitude, postion.longitude);
    marker.add(Marker(markerId: MarkerId("2"), position: p));
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
