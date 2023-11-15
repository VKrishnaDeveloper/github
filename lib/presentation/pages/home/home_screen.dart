import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_hub_user/core/color/app_colors.dart';
import 'package:my_hub_user/core/constnats/constants.dart';
import 'package:my_hub_user/core/utils/foldable_sidebar.dart';
import 'package:my_hub_user/core/utils/size_utils.dart';
import 'package:my_hub_user/presentation/pages/home/home_screen_content.dart';
import 'package:my_hub_user/presentation/side_menu/side_menu_scree.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FSBStatus? drawerStatus;
  int index = 2;

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      SizedBox(
        height: 60,
        width: 60,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Image.asset(
                height: 25,
                width: 25,
                "assets/images/car.png",
                color: Colors.white,
              ),
              const Text(
                "Cab",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 60,
        width: 60,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Image.asset(
                height: 25,
                width: 25,
                "assets/images/bus.png",
                color: Colors.white,
              ),
              const Text(
                "Tour",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 60,
        width: 60,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Image.asset(
                height: 25,
                width: 25,
                "assets/images/diver.png",
                color: Colors.white,
              ),
              const Text(
                "Driver",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 60,
        width: 60,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Image.asset(
                height: 25,
                width: 25,
                "assets/images/delivery.png",
                color: Colors.white,
              ),
              const Text(
                "Delivery",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
              icon: const Icon(
                Icons.menu,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                      ? FSBStatus.FSB_CLOSE
                      : FSBStatus.FSB_OPEN;
                });
              }),
          title: Row(
            children: [
              const Text(
                Constants.myHub,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              // SizedBox
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15.0),
                    /* -- Text and Icon -- */
                    hintText: "Search Store...",
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFB3B1B1),
                    ), // TextStyle
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.black54,
                    ), // Icon
                    /* -- Border Styling -- */
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45.0),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: Color(0xFFFF0000),
                      ), // BorderSide
                    ), // OutlineInputBorder
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45.0),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: Colors.grey,
                      ), // BorderSide
                    ), // OutlineInputBorder
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45.0),
                      borderSide: const BorderSide(
                        width: 2.0,
                        color: Colors.grey,
                      ), // BorderSide
                    ), // OutlineInputBorder
                  ), // InputDecoration
                ), // TextField
              ), // Expanded
            ],
          ),
        ),
        body: Stack(
          children: [
            FoldableSidebarBuilder(
              drawerBackgroundColor: Colors.blueAccent,
              drawer: SideMenu(
                closeDrawer: () {
                  setState(() {
                    drawerStatus = FSBStatus.FSB_CLOSE;
                  });
                },
              ),
              screenContents: const HomeScreenContentScreen(),
              status: drawerStatus,
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
            color: Colors.blue,
            buttonBackgroundColor: Colors.blue,
            backgroundColor: Colors.transparent,
            height: 60,
            index: index,
            items: items,
            onTap: (index) => setState(() {
                  this.index = index;
                })),
      ),
    );
  }
}
