import 'package:flutter/material.dart';
import 'package:my_hub_user/core/model/model_class.dart';

import '../../../core/data/data.dart';
import '../../../core/utils/foldable_sidebar.dart';
import '../selected_store/selected store_screen.dart';

class HomeScreenContentScreen extends StatefulWidget {
  const HomeScreenContentScreen({super.key});

  @override
  State<HomeScreenContentScreen> createState() =>
      _HomeScreenContentScreenState();
}

class _HomeScreenContentScreenState extends State<HomeScreenContentScreen> {
  FSBStatus? drawerStatus;

  final List<MyHubStoreServices> _results = DataClassDataClass.storeSerices;
  void _handleSearch(String input) {
    _results.clear();
    for (var str in DataClassDataClass.storeSerices) {
      if (str.title.toLowerCase().contains(input.toLowerCase())) {
        setState(() {
          _results.add(str.title);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 30),
            //   child: Container(
            //     decoration:
            //         BoxDecoration(borderRadius: BorderRadius.circular(20)),
            //     height: 45,
            //     width: 360,
            //     child: TextField(
            //       onChanged: _handleSearch,
            //       style: const TextStyle(
            //         color: Color(0xff020202),
            //         fontSize: 20,
            //         fontWeight: FontWeight.w400,
            //         letterSpacing: 0.5,
            //       ),
            //       decoration: InputDecoration(
            //         filled: true,
            //         fillColor: const Color(0xfff1f1f1),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8),
            //         ),
            //         hintText: "Search for Stores",
            //         hintStyle: const TextStyle(
            //             color: Color(0xffb2b2b2),
            //             fontSize: 20,
            //             fontWeight: FontWeight.w400,
            //             letterSpacing: 0.5,
            //             decorationThickness: 6),
            //         prefixIcon: const Icon(Icons.search),
            //         prefixIconColor: Colors.black,
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: DataClassDataClass.services
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (_) => HomeScreen()),
                          // );s
                        },
                        child: Card(
                          shadowColor: Colors.black,
                          color: Colors.white,
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            child: Text(
                              e.title,
                              style: const TextStyle(color: Colors.black45),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: DataClassDataClass.storeSerices
                    .map(
                      (store) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SelectedStoreScreen()));
                        },
                        child: Card(
                          shadowColor: Colors.grey,
                          color: Colors.white,
                          child: Container(
                            height: 100,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Container(
                                      padding: const EdgeInsets.all(
                                          2), // Border width

                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            20), // Image border
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(
                                              48), // Image radius
                                          child: Image.asset(
                                            store.storeImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            store.title,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            store.timeToDistnce,
                                            style: const TextStyle(
                                                color: Colors.black45),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            store.directonRoute,
                                            style: const TextStyle(
                                                color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: const Align(
                                    child: Icon(
                                      Icons.notifications_active,
                                      color: Colors.grey,
                                      size: 35,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
