import 'package:flutter/material.dart';
import 'package:my_hub_user/core/color/app_colors.dart';
import 'package:my_hub_user/core/constnats/appImages.dart';
import 'package:my_hub_user/core/constnats/constants.dart';
import 'package:my_hub_user/core/theme/theme_text.dart';
import 'package:my_hub_user/presentation/widgets/app_bar_widget.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<StatefulWidget> createState() {
    return ContactUsState();
  }
}

class ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: Constants.contactUs,
        isShowDone: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Image.asset(AppImages.dummyGoogleMap,
                fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Constants.address,
                      style: AppThemeText.themeText.labelLarge?.copyWith(
                          color: Colors.black.withOpacity(0.50),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      Constants.addressValue,
                      style: AppThemeText.themeText.labelLarge?.copyWith(
                          color: AppColors.primaryColor, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      Constants.phoneNumber,
                      style: AppThemeText.themeText.labelLarge?.copyWith(
                          color: Colors.black.withOpacity(0.50),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      Constants.phoneNumberValue,
                      style: AppThemeText.themeText.labelLarge?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      Constants.alternativePhoneNumber,
                      style: AppThemeText.themeText.labelLarge?.copyWith(
                          color: Colors.black.withOpacity(0.50),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      Constants.alternativePhoneNumberValue,
                      style: AppThemeText.themeText.labelLarge?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      Constants.fax,
                      style: AppThemeText.themeText.labelLarge?.copyWith(
                          color: Colors.black.withOpacity(0.50),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      Constants.faxValue,
                      style: AppThemeText.themeText.labelLarge?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      Constants.email,
                      style: AppThemeText.themeText.labelLarge?.copyWith(
                          color: Colors.black.withOpacity(0.50),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      Constants.emailValue,
                      style: AppThemeText.themeText.labelLarge?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
