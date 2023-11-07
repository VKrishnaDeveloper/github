import 'package:flutter/material.dart';
import 'package:my_hub_user/core/color/app_colors.dart';

import '../../core/constnats/constants.dart';
import '../pages/home/home_screen_content.dart';

class SideMenu extends StatelessWidget {
  final Function? closeDrawer;

  const SideMenu({Key? key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          // Container(
          //     width: double.infinity,
          //     height: 150,
          //     color: Colors.grey.withAlpha(20),
          //     decoration: const BoxDecoration(
          //       image: DecorationImage(
          //         image: ExactAssetImage("assets/images/profile_bg.png"),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     child: const Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Widget>[
          // CircleAvatar(
          //   radius: 45,
          //   backgroundColor: AppColors.primaryColor,
          //   child: CircleAvatar(
          //     radius: 40,
          //     backgroundImage: AssetImage('assets/images/logo.png'),
          //   ),
          // ),
          //         SizedBox(
          //           height: 20,
          //         ),
          //         Text("User Name")
          //       ],
          //     )
          //     ),
          Container(
            height: 170,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/images/profile_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              // color: Colors.grey.withOpacity(0.1),
              child: const CircleAvatar(
                radius: 48,
                backgroundColor: AppColors.primaryColor,
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/tom.jpeg'),
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomeScreenContentScreen()));
            },
            leading: const Icon(Icons.shopping_cart_outlined),
            iconColor: AppColors.primaryColor,
            title: const Text(
              Constants.shopping,
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_cart_checkout_outlined),
            iconColor: AppColors.primaryColor,
            title: const Text(Constants.myOrders),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.drive_eta),
            iconColor: AppColors.primaryColor,
            title: const Text(Constants.myBookings),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.car_rental_outlined),
            iconColor: AppColors.primaryColor,
            title: const Text(Constants.myAdvanceBooking),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.car_repair),
            iconColor: AppColors.primaryColor,
            title: const Text(Constants.subscribeDriver),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.favorite_outline_rounded),
            iconColor: AppColors.primaryColor,
            title: const Text(Constants.favouriteLocations),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.calculate),
            iconColor: AppColors.primaryColor,
            title: const Text(Constants.fareCalculator),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.exit_to_app),
            iconColor: AppColors.primaryColor,
            title: const Text(Constants.logout),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(Constants.availableCredits),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
