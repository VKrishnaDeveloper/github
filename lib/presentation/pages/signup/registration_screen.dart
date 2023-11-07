import 'package:flutter/material.dart';
import 'package:my_hub_user/core/color/app_colors.dart';
import 'package:my_hub_user/core/constnats/constants.dart';
import 'package:my_hub_user/presentation/pages/otp/otp_varification_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Image.asset("assets/images/top1.png",
                              width: size.width),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Image.asset("assets/images/top2.png",
                              width: size.width),
                        ),
                        Positioned(
                          top: 80,
                          left: 30,
                          child: Image.asset("assets/images/my_hub.jpg",
                              width: size.width * 0.35),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: AppColors.primaryColor,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: const TextField(
                      decoration:
                          InputDecoration(labelText: Constants.firstName),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: const TextField(
                      decoration:
                          InputDecoration(labelText: Constants.lastName),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: const TextField(
                      decoration: InputDecoration(labelText: Constants.email),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: const TextField(
                      decoration:
                          InputDecoration(labelText: Constants.mobileNumber),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: const TextField(
                      decoration:
                          InputDecoration(labelText: Constants.password),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: const TextField(
                      decoration: InputDecoration(
                          labelText: Constants.confirmPassworSignUp),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: const TextField(
                      decoration: InputDecoration(
                          labelText: Constants.referMobileNumber),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OtpVerificationScreen()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
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
                          "Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const OtpVerificationScreen()))
                      },
                      child: const Text(
                        "Already Have an Account? Sign in",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2661FA)),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset("assets/images/bottom2.png",
                        width: size.width),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
