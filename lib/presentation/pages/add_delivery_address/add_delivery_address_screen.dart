import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:my_hub_user/core/color/app_colors.dart';
import 'package:my_hub_user/core/constnats/constants.dart';
import 'package:my_hub_user/state_management/controllers/product_controller.dart';
import '../../../core/model/model_class.dart';
import '../order_summary/order_summary_screen.dart';
import 'package:http/http.dart' as http;

class AddDeliveryAddressScreen extends StatefulWidget {
  AddDeliveryAddressScreen({super.key});

  @override
  State<AddDeliveryAddressScreen> createState() =>
      _AddDeliveryAddressScreenState();
}

class _AddDeliveryAddressScreenState extends State<AddDeliveryAddressScreen> {
  TextEditingController addressController = TextEditingController();
  late String lat;
  late String lang;
  late String address;
  Location _locationController = Location();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.whiteColor,
              )),
          title: const Text("Add Delivery Address"),
        ),
        body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Card(
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        color: Colors.white,
                        child: TextFormField(
                          minLines: 2,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(),
                            labelText: 'House No./Flat No.',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Card(
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        color: Colors.white,
                        child: TextFormField(
                          controller: addressController,
                          minLines: 4,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(),
                            labelText: 'Address',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Card(
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        color: Colors.white,
                        child: TextFormField(
                          minLines: 2,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(),
                            labelText: 'LandMark',
                          ),
                        ),
                      ),
                    ),
                    titleCard("Or"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            getCurrentLocation(context).then((value) async {
                              addressController.text = value;
                            });
                          });
                        },
                        child: const Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.primaryColor,
                                ),
                                Text(
                                  "Current Location",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
        bottomNavigationBar: bottomNavigationBar);
  }

  Future<String> getCurrentLocation(BuildContext context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      // serviceEnabled = await _locationController.requestService();
      LoadingDialog.show(context);

      var value = await Geolocator.getCurrentPosition();
      double lats = value.latitude;
      double langs = value.longitude;
      String _host = 'https://maps.google.com/maps/api/geocode/json';
      final url =
          '$_host?key=$GOOGLE_MAPS_API_KEY&language=en&latlng=$lats,$langs';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        String _formattedAddress = data["results"][0]["formatted_address"];
        print("response ==== $_formattedAddress");
        LoadingDialog.hide(context);
        return _formattedAddress;
      } else {
        LoadingDialog.hide(context);
        return "ubale ";
      }
      // return await Geolocator.getCurrentPosition();
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location services are permanently denied");
    }

    return "";
  }

  Widget titleCard(
    String content,
  ) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ), //Textstyle
        ),
      ),
    );
  }
}

Widget get bottomNavigationBar {
  return Card(
    elevation: 10,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    color: Colors.white,
    child: Container(
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          border: Border.all(color: AppColors.gray_4),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: () {
                Get.to(() => OrderSummaryScreen());
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              textColor: Colors.white,
              padding: const EdgeInsets.all(0),
              child: Container(
                alignment: Alignment.center,
                height: 40.0,
                width: 140.0,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: -12.0,
                        blurRadius: 12.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 34, 167, 255),
                      Color.fromARGB(255, 41, 87, 255)
                    ])),
                padding: const EdgeInsets.all(0),
                child: const Text(
                  "SAVE",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        )),
  );
}

Widget productsDetails(String text, String value, bool bold) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:
              TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        ),
        Text(
          Constants.rupee + " " + value,
          style:
              TextStyle(fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        )
      ],
    ),
  );
}

Widget productsCouponCard() {
  return const Card(
    elevation: 2,
    shadowColor: Color.fromARGB(255, 14, 63, 103),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.countertops_outlined,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                "Apply Coupon",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final MyHubProductsModel product;
  final int quantity;
  final int index;
  const CartProductCard(
      {super.key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  height: 60,
                  width: 60,
                  child:
                      CircleAvatar(child: Image.asset(product.productImage))),
              const SizedBox(
                width: 20,
              ),
              Expanded(child: Text(product.productTitle)),
              IconButton(
                  onPressed: () {
                    controller.removeProducts(product);
                  },
                  icon: const Icon(Icons.remove_circle_outline)),
              Text("${quantity}"),
              IconButton(
                  onPressed: () {
                    controller.addProduct(product);
                  },
                  icon: const Icon(Icons.add_circle_outline)),
            ],
          ),
        ],
      ),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        // barrierColor: Colors.white,
        barrierDismissible: false,
        builder: (_) => LoadingDialog(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Platform.isAndroid
              ? const CircularProgressIndicator()
              : CupertinoActivityIndicator(
                  color: Colors.green,
                  radius: 20,
                  animating: true,
                ),
        ),
      ),
    );
  }
}
