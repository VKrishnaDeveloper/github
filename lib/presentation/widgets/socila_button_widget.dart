import 'package:flutter/material.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildBtn(
              "Sign in with Facebook", Colors.blue, Icons.facebook, context),
          const SizedBox(height: 10),
          buildBtn("Sign in with Gmail", Colors.red, Icons.email, context),
          // Visibility(
          //   visible: isFaceIdEnabled ? true : true,
          //   child: Container(
          //     child: _supportState == _SupportState.supported
          //         ? Padding(
          //             padding: AppBottomPaddings.small,
          //             child: GestureDetector(
          //               child: Container(
          //                 child: Image.asset(
          //                   ImageAsset.faceId,
          //                   fit: BoxFit.fill,
          //                   height: getVerticalSize(DIMENSION_40),
          //                   width: getVerticalSize(DIMENSION_40),
          //                 ),
          //               ),
          //               onTap: () async {
          //                 FocusManager.instance.primaryFocus?.unfocus();
          //                 _authenticate();
          //               },
          //             ),
          //           )
          //         : null,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildBtn(String text, Color btnColor, IconData iconData,
          BuildContext context) =>
      Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: btnColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      );
}
