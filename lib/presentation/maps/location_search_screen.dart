import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_hub_user/core/utils/location_list_tile.dart';

import '../../core/color/app_colors.dart';
import '../../core/constnats/constants.dart';
import '../../core/model/autocomplate_prediction.dart';
import '../../core/model/place_auto_complate_response.dart';
import '../../core/utils/network_utility.dart';

class LocationSearchScreen extends StatefulWidget {
  const LocationSearchScreen({super.key});

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(40),
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
                  border: const OutlineInputBorder(),
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
          const Divider(
            height: 4,
            thickness: 4,
            color: AppColors.black1,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/images/location_pin.svg",
                height: 16,
              ),
              label: const Text("Use my Current Location"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor10LightTheme,
                foregroundColor: AppColors.textColorLightTheme,
                elevation: 0,
                fixedSize: const Size(double.infinity, 40),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          const Divider(
            height: 4,
            thickness: 4,
            color: AppColors.secondaryColor5LightTheme,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: placePredictions.length,
                  itemBuilder: (context, index) => LocationListTile(
                      location: placePredictions[index].description!,
                      press: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "${placePredictions[index].description!} " +
                                    "${placePredictions[index].placeId}")));
                      }
                      
                      )))
        ],
      )),
    );
  }

  // void _launchMapsUrl(double lat, double lon) async {
  //   final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
