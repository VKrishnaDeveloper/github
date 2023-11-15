import 'package:flutter/material.dart';
import 'package:my_hub_user/core/color/app_colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteColor,
            )),
        title: const Text(
          "Settings",
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                titleCard("Account"),
                cardWidget(
                    "Profile",
                    const Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 14, 63, 103),
                    )),
                cardWidget(
                  "Push Notification",
                  const Icon(Icons.notifications,
                      color: Color.fromARGB(255, 14, 63, 103)),
                ),
                cardWidget(
                    "Share",
                    const Icon(Icons.share,
                        color: Color.fromARGB(255, 14, 63, 103))),
                cardWidget(
                    "Change Password",
                    const Icon(Icons.lock,
                        color: Color.fromARGB(255, 14, 63, 103))),
                cardWidget(
                    "Sign Out",
                    const Icon(Icons.logout_outlined,
                        color: Color.fromARGB(255, 14, 63, 103))),
                const SizedBox(
                  height: 20,
                ),
                titleCard("Help"),
                const SizedBox(
                  height: 7,
                ),
                cardWidget(
                    "Contact Support",
                    const Icon(Icons.call,
                        color: Color.fromARGB(255, 14, 63, 103))),
                cardWidget(
                    "About Us",
                    const Icon(Icons.info_outline_rounded,
                        color: Color.fromARGB(255, 14, 63, 103))),
                cardWidget(
                    "Privacy Policy",
                    const Icon(Icons.privacy_tip_outlined,
                        color: Color.fromARGB(255, 14, 63, 103))),
                cardWidget(
                    "Terms & Conditions",
                    const Icon(Icons.library_books_outlined,
                        color: Color.fromARGB(255, 14, 63, 103))),
                cardWidget(
                    "Refund Policy",
                    const Icon(Icons.currency_exchange_rounded,
                        color: Color.fromARGB(255, 14, 63, 103))),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget cardWidget(
    String content,
    Icon icon,
  ) {
    return Card(
      elevation: 10,
      shadowColor: const Color.fromARGB(255, 14, 63, 103),
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              icon, //CircleAvatar
              const SizedBox(
                width: 10,
              ), //SizedBox
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ), //Textstyle
              ), //Text
              //SizedBox
            ],
          ),
        ),
      ),
    );
  }

  Widget titleCard(
    String content,
  ) {
    return Container(
      alignment: Alignment.centerLeft,
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
