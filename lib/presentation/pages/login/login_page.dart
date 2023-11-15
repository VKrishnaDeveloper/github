import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:my_hub_user/core/color/app_colors.dart';
import 'package:my_hub_user/core/components/background.dart';
import 'package:my_hub_user/core/constnats/constants.dart';
import 'package:my_hub_user/core/constnats/image_asset.dart';
import 'package:my_hub_user/presentation/pages/home/home_screen.dart';
import 'package:my_hub_user/presentation/pages/signup/registration_screen.dart';
import 'package:my_hub_user/presentation/widgets/socila_button_widget.dart';
import '../../../core/theme/app_paddings.dart';
import '../../../core/utils/foldable_sidebar.dart';
import '../../../core/utils/pref_utils.dart';
import '../../maps/google_map_screen.dart';
import '../../maps/map_screen.dart';

class LoginScreen extends StatefulWidget {
  static final _formKey = GlobalKey<FormState>();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FSBStatus? drawerStatus;
  late final LocalAuthentication auth;
  bool _supportState = false;
  bool _isAuthenticating = false;
  String _authorized = 'Not Authorized';

  @override
  void initState() {
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) {
      setState(() {
        _supportState = isSupported;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isFaceIdEnabled =
        PrefUtils().getBoolValue(SharedPreferencesString.isFaceIdEnabled);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Form(
            key: LoginScreen._formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: false,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: const Text(
                      Constants.loginScreenName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA),
                          fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(height: 200),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Username",
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {});
                      value = value;
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Password"),
                    textInputAction: TextInputAction.done,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: const Text(
                    "Forgot your password?",
                    style: TextStyle(fontSize: 12, color: Color(0XFF2661FA)),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.centerRight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: MaterialButton(
                    onPressed: () {
                      if (LoginScreen._formKey.currentState!.validate()) {
                        // Navigate the user to the Home page

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GoogleMapScreen()));
                      } else {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text('Please fill input')),
                        // );
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 45.0,
                      width: size.width * 0.5,
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
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                    // alignment: Alignment.centerRight,
                    // margin:
                    // const EdgeInsets.symmetric(horizontal: 60, vertical: 0),
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (_supportState)
                      Platform.isAndroid
                          ? Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: GestureDetector(
                                child: Image.asset(
                                  ImageAsset.fingerPrint,
                                  fit: BoxFit.fill,
                                  height: 80,
                                  width: 80,
                                  color: AppColors.primaryColor,
                                ),
                                onTap: () async {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  _authenticate();
                                },
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: GestureDetector(
                                child: Image.asset(
                                  ImageAsset.faceId,
                                  fit: BoxFit.fill,
                                  height: 80,
                                  width: 80,
                                  color: AppColors.primaryColor,
                                ),
                                onTap: () async {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  _authenticate();
                                },
                              ),
                            )
                    else
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Image.asset(
                          ImageAsset.faceId,
                          fit: BoxFit.fill,
                          height: 80,
                          width: 80,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    const SizedBox(
                      width: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: const SocialSignIn(),
                    ),
                  ],
                )),
                Container(
                  alignment: Alignment.centerRight,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()))
                    },
                    child: const Text(
                      "Don't Have an Account? Sign up",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    setState(() {
      if (authenticated) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyHomePage()));
        // authVerifyLoginNavigation();
      } else {}
    });
  }
}
