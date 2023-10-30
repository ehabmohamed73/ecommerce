import 'package:ecommerceapp/controller/address/add_controller.dart';
import 'package:ecommerceapp/core/classes/statusrequest.dart';
import 'package:ecommerceapp/core/constants/appColors.dart';
import 'package:ecommerceapp/view/widget/loadingcircular.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add new address'),
      ),
      body: Container(
          child: GetBuilder<AddAddressController>(
              builder: ((controllerpage) =>
                  controllerpage.statusRequest == StatusRequest.loading
                      ? const LoadingCircular()
                      : Column(children: [
                          if (controllerpage.kGooglePlex != null)
                            Expanded(
                                child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                  GoogleMap(
                                    markers: controllerpage.marker.toSet(),
                                    onTap: (argument) {
                                      controllerpage.addMarker(argument);
                                    },
                                    mapType: MapType.normal,
                                    initialCameraPosition:
                                        controllerpage.kGooglePlex!,
                                    onMapCreated:
                                        (GoogleMapController controllermap) {
                                      controllerpage.completercontroller!
                                          .complete(controllermap);
                                    },
                                  ),
                                  Positioned(
                                      child: Container(
                                    width: 200,
                                    child: MaterialButton(
                                      color: AppColor.fourthColor,
                                      onPressed: () {
                                        controllerpage.goToAddAdressDetails();
                                      },
                                      child: const Text(
                                        "Next",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ),
                                  ))
                                ])),
                        ])))),
    );
  }
}
