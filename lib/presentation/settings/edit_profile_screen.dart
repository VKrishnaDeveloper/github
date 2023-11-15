

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_hub_user/core/color/app_colors.dart';
import 'package:my_hub_user/core/constnats/constants.dart';
import 'package:my_hub_user/presentation/pages/home/home_screen.dart';
import 'package:my_hub_user/presentation/widgets/app_bar_widget.dart';

import '../../../core/theme/theme_text.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<StatefulWidget> createState() {
    return EditProfileState();
  }

}

class EditProfileState extends State<EditProfile> {

  final form = GlobalKey<FormState>();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode mobileFocusNode = FocusNode();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(title: "Profile", isShowDone: true,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 170,
                width: MediaQuery.of(context).size.width,
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
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Form(
                  key: form,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/2.5,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(Constants.firstName,
                                    style: AppThemeText.themeText.labelLarge?.copyWith(
                                        color: Colors.black.withOpacity(0.50),
                                        fontWeight: FontWeight.w400)),
                                TextFormField(
                                  enableInteractiveSelection: false,
                                  cursorColor: AppColors.primaryColor,
                                  focusNode: focus,
                                  onTap: () {
                                  },
                                  onChanged: (value) {
                                  },
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  onFieldSubmitted: (v) {

                                    FocusScope.of(context)
                                        .requestFocus(lastNameFocusNode);
                                  },
                                  decoration: InputDecoration(
                                    hintText: "",
                                    hintStyle: AppThemeText.themeText.labelLarge?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                    contentPadding:
                                    const EdgeInsets.fromLTRB(12, 10, 0, 6),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                          Colors.transparent.withOpacity(0.25)),
                                      //  when the TextFormField in unfocused
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Color(0xFF116AE0)),
                                      //  when the TextFormField in focused
                                    ),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                  style: AppThemeText.themeText.labelLarge?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                  obscureText: false,
                                  controller: firstNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {}
                                    return null;
                                  },
                                ),
                              ],
                            )
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2.5,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(Constants.lastName,
                                    style: AppThemeText.themeText.labelLarge?.copyWith(
                                        color: Colors.black.withOpacity(0.50),
                                        fontWeight: FontWeight.w400)),
                                TextFormField(
                                  enableInteractiveSelection: false,
                                  cursorColor: AppColors.primaryColor,
                                  focusNode: focus,
                                  onTap: () {
                                  },
                                  onChanged: (value) {
                                  },
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  onFieldSubmitted: (v) {
                                    FocusScope.of(context)
                                        .requestFocus(emailFocusNode);
                                  },
                                  decoration: InputDecoration(
                                    hintText: "",
                                    hintStyle: AppThemeText.themeText.labelLarge?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                    contentPadding:
                                    const EdgeInsets.fromLTRB(12, 10, 0, 6),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                          Colors.transparent.withOpacity(0.25)),
                                      //  when the TextFormField in unfocused
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Color(0xFF116AE0)),
                                      //  when the TextFormField in focused
                                    ),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                  style: AppThemeText.themeText.labelLarge?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                  obscureText: false,
                                  controller: lastNameController,
                                  validator: (value) {
                                    if (value!.isEmpty) {}
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(Constants.email,
                                style: AppThemeText.themeText.labelLarge?.copyWith(
                                    color: Colors.black.withOpacity(0.50),
                                    fontWeight: FontWeight.w400)),
                            TextFormField(
                              enableInteractiveSelection: false,
                              cursorColor: AppColors.primaryColor,
                              focusNode: focus,
                              onChanged: (value) {
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => node.nextFocus(),
                              onFieldSubmitted: (v) {
                                FocusScope.of(context)
                                    .requestFocus(mobileFocusNode);
                              },
                              decoration: InputDecoration(
                                hintText: "",
                                hintStyle: AppThemeText.themeText.labelLarge?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                const EdgeInsets.fromLTRB(12, 10, 0, 6),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      Colors.transparent.withOpacity(0.25)),
                                  //  when the TextFormField in unfocused
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xFF116AE0)),
                                  //  when the TextFormField in focused
                                ),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              style: AppThemeText.themeText.labelLarge?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                              obscureText: false,
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {}
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(Constants.mobileNumber,
                                style: AppThemeText.themeText.labelLarge?.copyWith(
                                    color: Colors.black.withOpacity(0.50),
                                    fontWeight: FontWeight.w400)),
                            TextFormField(
                              enableInteractiveSelection: false,
                              cursorColor: AppColors.primaryColor,
                              focusNode: focus,
                              onChanged: (value) {
                              },
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => node.nextFocus(),
                              onFieldSubmitted: (v) {
                              },
                              decoration: InputDecoration(
                                hintText: "",
                                hintStyle: AppThemeText.themeText.labelLarge?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                                contentPadding:
                                const EdgeInsets.fromLTRB(12, 10, 0, 6),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                      Colors.transparent.withOpacity(0.25)),
                                  //  when the TextFormField in unfocused
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xFF116AE0)),
                                  //  when the TextFormField in focused
                                ),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              style: AppThemeText.themeText.labelLarge?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                              obscureText: false,
                              controller: mobileController,
                              validator: (value) {
                                if (value!.isEmpty) {}
                                return null;
                              },
                            ),
                            const SizedBox(height: 80),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: MaterialButton(
                                onPressed: () {
                                  Get.off(() => const MyHomePage());
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  width: MediaQuery.of(context).size.width,
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
                                    "Submit",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

}