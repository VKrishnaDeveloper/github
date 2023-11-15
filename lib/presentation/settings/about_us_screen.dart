

import 'package:flutter/material.dart';
import 'package:my_hub_user/core/constnats/constants.dart';
import 'package:my_hub_user/core/theme/theme_text.dart';
import 'package:my_hub_user/presentation/widgets/app_bar_widget.dart';

class AboutUs extends StatefulWidget{
  const AboutUs({super.key});

  @override
  State<StatefulWidget> createState() {
    return AboutUsState();
  }

}

class AboutUsState extends State<AboutUs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(title: 'About Us',isShowDone: true,),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(Constants.aboutUsText,
                  textAlign: TextAlign.justify,
                  style: AppThemeText.themeText.bodyMedium
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.w400)),
            ),
          )),
    );
  }
}