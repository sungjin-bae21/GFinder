import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:g_finder/employ_data.dart';

typedef HtmlLoadCallback = void Function(String, TargetComponey);

// 가장 먼저 스마게 채용 페이치가 나온다.
class HtmlLoader extends StatefulWidget {
  HtmlLoadCallback? _htmlLoadCallback;

  HtmlLoader(HtmlLoadCallback callback) {
    _htmlLoadCallback = callback;
  }

  @override
  HtmlLoaderState createState() {
     return HtmlLoaderState();
  }

  static HtmlLoaderState? of(BuildContext context) {
      return context.findAncestorStateOfType<HtmlLoaderState>();
  }
}

class HtmlLoaderState extends State<HtmlLoader> {
  Timer? timer; 
  static HtmlLoaderState? htmlLoader;
  WebViewController? _controller;
  bool working = true;
  TargetComponey targetComponey = TargetComponey.none; 
  String url = "https://google.com";

  @override
  Widget build(BuildContext context) {
      bool first = true;
      htmlLoader = this;
      print("generated html loader");
      return WebView(
        initialUrl: url,
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        onPageFinished: (_) {
          print("onPageFinished");
          if (first) {
            working = false;
            first = false;
            return;
          }
        },
      );
  }

  void readHTML() {
    Future<String> html = _controller!.evaluateJavascript("window.document.getElementsByTagName('html')[0].outerHTML;");
    html.then((value) {
      this.widget._htmlLoadCallback!(value, targetComponey);
      print("read data");
      working = false;
    });
  }

  // 자바스크립트를 돌려야 finish callback 을 받을 수 있다.
  void openCrawlingPage(String newUrl ,TargetComponey target) async {
    targetComponey = target;
    working = true;
    url = newUrl;
    await _controller!.loadUrl(newUrl);
    Future.delayed(Duration(seconds: 2), () {
      print("loadurl");
      readHTML();
    });
    
  }

  void inputJavascirpt(String scriptName) async {
    working = true;
    await _controller!.evaluateJavascript(scriptName);
    Future.delayed(Duration(seconds: 2), () {
      print("input java script2");
      readHTML();
    });
  }
}
      
    

 