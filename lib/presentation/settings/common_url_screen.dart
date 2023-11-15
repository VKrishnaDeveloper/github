import 'package:flutter/material.dart';
import 'package:my_hub_user/presentation/widgets/app_bar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonScreen extends StatefulWidget {
  final String urlString, title;
  const CommonScreen({super.key, required this.urlString, required this.title});

  @override
  State<StatefulWidget> createState() {
    return CommonScreenState();
  }
}

class CommonScreenState extends State<CommonScreen> {

  late WebViewController controller;
  bool isLoading=true;
  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.urlString.toString()));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(title: widget.title.toString(),isShowDone: true,),
      body: SafeArea(
          child: WebViewWidget(controller: controller)),
    );
  }
}
